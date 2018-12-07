" ====================================================
"   Copyright (C)2018 All rights reserved.
"
"   Author        : bbxytl
"   Email         : bbxytl@gmail.com
"   File Name     : git.vim
"   Last Modified : 2018-12-07 18:29
"   Describe      :
"
" ====================================================


" ###############################
" Git

" ##### 同git diff,实时展示文件中修改的行
" 只是不喜欢除了行号多一列, 默认关闭,gs时打开
Bundle 'airblade/vim-gitgutter'
""""""
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
nnoremap gt :GitGutterToggle<CR>
nnoremap gp :GitGutterPrevHunk<CR>
nnoremap gn :GitGutterNextHunk<CR>
nnoremap gr :GitGutterRevertHunk<CR>
" 一个命令切换高亮行
func! CustomGitGutterLineHights()
    if g:gitgutter_highlight_lines is 1
        exe ":GitGutterLineHighlightsDisable"
    else
        exe ":GitGutterLineHighlightsEnable"
    endif
endfunc
nnoremap gh :call CustomGitGutterLineHights()<CR>

" ##### 使用 git blame 等功能
Bundle "tpope/vim-fugitive"
" 使用命令
" Gblame, Gstatue, help fugitive
" 使用 Glog 可查看历史版本文件
nnoremap gb :Gblame<CR>

" 在vim中使用 git 命令
Bundle 'motemen/git-vim'

" ##### 可以查看回到某个历史状态
Bundle 'sjl/gundo.vim'
""""""
noremap <leader>ht :GundoToggle<CR>

" ##### 在 nerdtree 上显示目录文件的 git 状态
Bundle 'Xuyuanp/nerdtree-git-plugin'


