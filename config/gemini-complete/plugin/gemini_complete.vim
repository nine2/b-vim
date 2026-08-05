vim9script

if exists('g:loaded_gemini_complete')
  finish
endif
g:loaded_gemini_complete = 1

gemini_complete#Setup()

augroup gemini_complete
  autocmd!
  autocmd TextChangedI * gemini_complete#OnTextChanged()
  autocmd InsertLeave * gemini_complete#Dismiss()
  autocmd CursorMovedI * gemini_complete#OnCursorMoved()
augroup END

command! GeminiToggle gemini_complete#Toggle()
