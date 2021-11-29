" ====================================================
"   Copyright (C) 2021  All rights reserved.
"
"   Author        : bbxytl
"   Email         : bbxytl@gmail.com
"   File Name     : javascript.vim
"   Last Modified : 2021-08-06 10:38
"   Describe      :
"
" ====================================================

Bundle 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
