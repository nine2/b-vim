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
