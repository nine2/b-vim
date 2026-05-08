" ====================================================
"   Copyright (C)2018 All rights reserved.
"
"   Author        : bbxytl
"   Email         : bbxytl@gmail.com
"   File Name     : git.vim
"   Last Modified : 2022-05-10 18:55
"   Describe      :
"
" ====================================================


" ###############################
" Git

" ##### 同git diff,实时展示文件中修改的行
" 只是不喜欢除了行号多一列, 默认关闭,gs时打开
Plug 'airblade/vim-gitgutter'
""""""
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
nnoremap gt :GitGutterToggle<CR>
nnoremap gp :GitGutterPrevHunk<CR>
nnoremap gn :GitGutterNextHunk<CR>
" gz: 撤销当前 hunk（让出 gr 给 LeaderF gtags -r）
"     选 gz 因为 g+z 在 vim 中无任何内置含义，覆盖零代价
nnoremap gz :GitGutterUndoHunk<CR>
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
Plug 'tpope/vim-fugitive'
" 使用命令
" GStatue, help fugitive
" 使用 Glog 可查看历史版本文件
nnoremap gb :G blame<CR>
" <leader>gst: git status（让出 gs 给 LeaderF gtags -s）
nnoremap <leader>gst :G status<CR>
" 查看 bitbucket
Plug 'nine2/vim-fubitive'
" :Gbrowse
nnoremap g<space> :GBrowse<CR>
" rhubarb.vim: GitHub extension for fugitive.vim
Plug 'tpope/vim-rhubarb'

" Ch.6 删除：git-vim（已被 vim-fugitive 取代，已归档）

" ##### 可以查看回到某个历史状态
Plug 'sjl/gundo.vim'
""""""
noremap <leader>ht :GundoToggle<CR>

" ##### 在 nerdtree 上显示目录文件的 git 状态
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/gv.vim'

Plug 'nine2/git-messenger.vim'
noremap gm :GitMessenger<CR>
" hi gitmessengerPopupNormal term=None guifg=#eeeeee guibg=#333333 ctermfg=255 ctermbg=234
" hi gitmessengerHeader term=None guifg=#88b8f6 ctermfg=111
" hi gitmessengerHash term=None guifg=#f0eaaa ctermfg=229
" hi gitmessengerHistory term=None guifg=#fd8489 ctermfg=210
" Normal color in popup window with 'CursorLine'
hi link gitmessengerPopupNormal CursorLine
" Header such as 'Commit:', 'Author:' with 'Statement' highlight group
hi link gitmessengerHeader Statement
" Commit hash at 'Commit:' header with 'Special' highlight group
hi link gitmessengerHash Special
" History number at 'History:' header with 'Title' highlight group
hi link gitmessengerHistory Title

let g:git_messenger_always_into_popup = v:true

