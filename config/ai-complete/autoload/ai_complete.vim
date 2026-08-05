vim9script

# ---- 内部状态 ----
var debounceTimer: number = -1
var activeJob: job = null_job
var suggestionLines: list<string> = []
var suggestionWinid: number = -1
var acceptingInProgress: bool = false
var lastRawResponse: string = ''
var lastExitStatus: number = -999

export def Setup()
  if !exists('g:ai_complete_enabled')
    g:ai_complete_enabled = 1
  endif
  if !exists('g:ai_complete_api_key')
    g:ai_complete_api_key = getenv('MODELSCOPE_API_KEY')
  endif
  if !exists('g:ai_complete_model')
    g:ai_complete_model = 'Qwen/Qwen3-Coder-30B-A3B-Instruct'
  endif
  if !exists('g:ai_complete_debounce_ms')
    g:ai_complete_debounce_ms = 400
  endif
  if !exists('g:ai_complete_context_before')
    g:ai_complete_context_before = 60
  endif
  if !exists('g:ai_complete_context_after')
    g:ai_complete_context_after = 20
  endif
  if !exists('g:ai_complete_max_lines')
    g:ai_complete_max_lines = 12
  endif
  if !exists('g:ai_complete_excluded_ft')
    g:ai_complete_excluded_ft = ['gitcommit', 'markdown', 'text']
  endif
  if !exists('g:ai_complete_debug')
    g:ai_complete_debug = 0
  endif
enddef

export def BuildPrompt(before: list<string>, after: list<string>, filetype: string): string
  var prefix = join(before, "\n")
  var suffix = join(after, "\n")
  return "You are a code completion engine. Continue the code exactly at <CURSOR>. " ..
    $"The file type is {filetype}. Output ONLY the code that comes AFTER <CURSOR> — " ..
    "do not repeat anything before <CURSOR>, no explanation, no markdown code fences.\n\n" ..
    $"--- CODE BEFORE CURSOR ---\n{prefix}\n<CURSOR>\n--- CODE AFTER CURSOR ---\n{suffix}"
enddef

export def StripCodeFences(text: string): string
  var lines = split(text, "\n", true)
  if len(lines) >= 2 && lines[0] =~ '^```' && lines[len(lines) - 1] =~ '^\s*```\s*$'
    return join(lines[1 : len(lines) - 2], "\n")
  endif
  return text
enddef

export def TruncateLines(text: string, maxLines: number): list<string>
  var stripped = StripCodeFences(text)
  var lines = split(stripped, "\n", true)
  if len(lines) > 0 && lines[len(lines) - 1] == ''
    lines = lines[0 : len(lines) - 2]
  endif
  if len(lines) > maxLines
    lines = lines[0 : maxLines - 1]
  endif
  return lines
enddef

export def ParseAIResponse(jsonBody: string): list<string>
  try
    var decoded = json_decode(jsonBody)
    var text = decoded['choices'][0]['message']['content']
    return TruncateLines(text, get(g:, 'ai_complete_max_lines', 12))
  catch
    return []
  endtry
enddef

export def ShouldRequest(filetype: string): bool
  var excluded = get(g:, 'ai_complete_excluded_ft', ['gitcommit', 'markdown', 'text'])
  return index(excluded, filetype) == -1
enddef

export def SplitForInsert(lines: list<string>): dict<any>
  if empty(lines)
    return {first: '', rest: []}
  endif
  return {first: lines[0], rest: lines[1 :]}
enddef

export def BuildCurlConfig(apiKey: string, model: string, prompt: string): dict<string>
  var url = 'https://api-inference.modelscope.cn/v1/chat/completions'
  var body = json_encode({
    model: model,
    messages: [{role: 'user', content: prompt}],
  })
  var bodyFile = tempname()
  writefile([body], bodyFile)
  var outFile = tempname()
  var cfgFile = tempname()
  var cfgLines = [
    $'url = "{url}"',
    'header = "Content-Type: application/json"',
    $'header = "Authorization: Bearer {apiKey}"',
    $'data-binary = @{bodyFile}',
    $'output = "{outFile}"',
    'silent',
  ]
  writefile(cfgLines, cfgFile)
  setfperm(cfgFile, 'rw-------')
  return {cfgFile: cfgFile, bodyFile: bodyFile, outFile: outFile}
enddef

def CancelPending()
  if debounceTimer != -1
    timer_stop(debounceTimer)
    debounceTimer = -1
  endif
  if activeJob != null_job && job_status(activeJob) == 'run'
    job_stop(activeJob)
  endif
  activeJob = null_job
enddef

def HandleJobExit(cfgFile: string, bodyFile: string, outFile: string, status: number)
  var body = ''
  if status == 0 && filereadable(outFile)
    body = join(readfile(outFile), "\n")
  endif
  delete(cfgFile)
  delete(bodyFile)
  delete(outFile)
  activeJob = null_job
  lastRawResponse = body
  lastExitStatus = status
  if empty(body)
    return
  endif
  var lines = ParseAIResponse(body)
  if empty(lines)
    return
  endif
  suggestionLines = lines
  RenderSuggestion(lines)
enddef

def RenderSuggestion(lines: list<string>)
  if suggestionWinid != -1
    popup_close(suggestionWinid)
  endif
  if empty(lines)
    suggestionWinid = -1
    return
  endif
  suggestionWinid = popup_create(lines, {
    line: 'cursor',
    col: 'cursor',
    pos: 'topleft',
    highlight: 'Comment',
    zindex: 50,
    wrap: false,
  })
enddef

export def Dismiss()
  if suggestionWinid != -1
    popup_close(suggestionWinid)
  endif
  suggestionWinid = -1
  suggestionLines = []
enddef

export def HasSuggestion(): bool
  return !empty(suggestionLines)
enddef

export def OnCursorMoved()
  if acceptingInProgress
    return
  endif
  Dismiss()
enddef

export def Accept(): string
  if empty(suggestionLines)
    return ''
  endif
  var lines = suggestionLines
  Dismiss()
  acceptingInProgress = true
  var parts = SplitForInsert(lines)
  var curLine = getline('.')
  var col = col('.')
  var newFirstLine = curLine[0 : col - 2] .. parts.first .. curLine[col - 1 :]
  setline('.', newFirstLine)
  var insertCol = col + len(parts.first)
  if !empty(parts.rest)
    append('.', parts.rest)
    cursor(line('.') + len(parts.rest), len(parts.rest[len(parts.rest) - 1]) + 1)
  else
    cursor(line('.'), insertCol)
  endif
  acceptingInProgress = false
  return ''
enddef

def FireRequest(timerId: number)
  debounceTimer = -1
  if !get(g:, 'ai_complete_enabled', 1)
    return
  endif
  if !ShouldRequest(&filetype)
    return
  endif
  var apiKey = get(g:, 'ai_complete_api_key', '')
  if empty(apiKey)
    return
  endif
  var beforeStart = max([1, line('.') - g:ai_complete_context_before])
  var before = getline(beforeStart, line('.'))
  var curLine = getline('.')
  var col = col('.')
  if !empty(before)
    before[len(before) - 1] = curLine[0 : col - 2]
  endif
  var afterEnd = min([line('$'), line('.') + g:ai_complete_context_after])
  var after = getline(line('.'), afterEnd)
  if !empty(after)
    after[0] = curLine[col - 1 :]
  endif
  var prompt = BuildPrompt(before, after, &filetype)
  var cfg = BuildCurlConfig(apiKey, g:ai_complete_model, prompt)
  CancelPending()
  activeJob = job_start(['curl', '-s', '-K', cfg.cfgFile], {
    exit_cb: (j, status) => HandleJobExit(cfg.cfgFile, cfg.bodyFile, cfg.outFile, status)
  })
enddef

export def OnTextChanged()
  CancelPending()
  suggestionLines = []
  if !get(g:, 'ai_complete_enabled', 1)
    return
  endif
  debounceTimer = timer_start(get(g:, 'ai_complete_debounce_ms', 400), FireRequest)
enddef

export def DebugPendingCount(): number
  var n = 0
  if debounceTimer != -1
    n += 1
  endif
  if activeJob != null_job && job_status(activeJob) == 'run'
    n += 1
  endif
  return n
enddef

export def DebugSuggestion(): list<string>
  return suggestionLines
enddef

export def DebugLastRawResponse(): string
  return lastRawResponse
enddef

export def DebugLastExitStatus(): number
  return lastExitStatus
enddef

# 仅供测试注入用：绕开真实网络请求，直接验证 Accept()/HasSuggestion()/Dismiss() 逻辑
export def DebugSetSuggestion(lines: list<string>)
  suggestionLines = lines
enddef

export def Toggle()
  g:ai_complete_enabled = !get(g:, 'ai_complete_enabled', 1)
  if !g:ai_complete_enabled
    CancelPending()
    Dismiss()
  endif
  echom $'AI completion: {g:ai_complete_enabled ? "ON" : "OFF"}'
enddef
