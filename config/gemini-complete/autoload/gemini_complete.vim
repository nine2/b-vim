vim9script

# ---- 内部状态 ----
var debounceTimer: number = -1
var activeJob: job = null_job
var suggestionLines: list<string> = []
var suggestionWinid: number = -1
var acceptingInProgress: bool = false

export def Setup()
  if !exists('g:gemini_complete_enabled')
    g:gemini_complete_enabled = 1
  endif
  if !exists('g:gemini_complete_api_key')
    g:gemini_complete_api_key = getenv('GEMINI_API_KEY')
  endif
  if !exists('g:gemini_complete_model')
    g:gemini_complete_model = 'gemini-2.5-flash-lite'
  endif
  if !exists('g:gemini_complete_debounce_ms')
    g:gemini_complete_debounce_ms = 400
  endif
  if !exists('g:gemini_complete_context_before')
    g:gemini_complete_context_before = 60
  endif
  if !exists('g:gemini_complete_context_after')
    g:gemini_complete_context_after = 20
  endif
  if !exists('g:gemini_complete_max_lines')
    g:gemini_complete_max_lines = 12
  endif
  if !exists('g:gemini_complete_excluded_ft')
    g:gemini_complete_excluded_ft = ['gitcommit', 'markdown', 'text']
  endif
  if !exists('g:gemini_complete_debug')
    g:gemini_complete_debug = 0
  endif
enddef

export def BuildPrompt(before: list<string>, after: list<string>, filetype: string): string
  var prefix = join(before, "\n")
  var suffix = join(after, "\n")
  return "You are a code completion engine. Continue the code exactly at <CURSOR>. " ..
    $"The file type is {filetype}. Output ONLY the raw code to insert at <CURSOR> — " ..
    "no explanation, no markdown code fences, no repeating existing code.\n\n" ..
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

export def ParseGeminiResponse(jsonBody: string): list<string>
  try
    var decoded = json_decode(jsonBody)
    var text = decoded['candidates'][0]['content']['parts'][0]['text']
    return TruncateLines(text, get(g:, 'gemini_complete_max_lines', 12))
  catch
    return []
  endtry
enddef
