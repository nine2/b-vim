" ====================================================
"   Copyright (C) 2021  All rights reserved.
"
"   Author        : bbxytl
"   Email         : bbxytl@gmail.com
"   File Name     : leetcode.vim
"   Last Modified : 2021-02-07 14:31
"   Describe      :
"
" ====================================================

" https://github.com/ianding1/leetcode.vim
Bundle 'ianding1/leetcode.vim'
let g:leetcode_china=1
let g:leetcode_solution_filetype='golang'
let g:leetcode_browser='chrome'
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>
