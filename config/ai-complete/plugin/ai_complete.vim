vim9script

if exists('g:loaded_ai_complete')
  finish
endif
g:loaded_ai_complete = 1

ai_complete#Setup()

augroup ai_complete
  autocmd!
  autocmd TextChangedI * ai_complete#OnTextChanged()
  autocmd InsertLeave * ai_complete#Dismiss()
  autocmd CursorMovedI * ai_complete#OnCursorMoved()
augroup END

command! AICompleteToggle ai_complete#Toggle()
