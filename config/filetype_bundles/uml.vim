" ====================================================
"   Copyright (C)2019 All rights reserved.
"
"   Author        : bbxytl
"   Email         : bbxytl@gmail.com
"   File Name     : uml.vim
"   Last Modified : 2019-07-01 12:49
"   Describe      :
"
" ====================================================

Bundle 'aklt/plantuml-syntax'
" 参考文档：http://plantuml.com/zh/starting
" plantuml 为自定义的可执行文件，内容为：
" #!/bin/bash
" java -jar $HOME/.local/lib/java/plantuml.jar -tsvg $@
" 文件加入到 PATH 里
let g:plantuml_executable_script='plantuml'
let g:plantuml_set_makeprg = 1
" nnoremap <leader><F10> :w<CR> :!plantuml %<CR>
" au FileType uml,plantuml nnoremap <F10> :w<CR> :!plantuml %<CR>
" au FileType uml,plantuml inoremap <F10> <Esc>:w<CR> :!plantuml %<CR>
" autocmd InsertLeave * :w<CR>
"
Bundle 'tyru/open-browser.vim'
Bundle 'nine2/plantuml-previewer.vim'
let g:plantuml_previewer#save_format='svg'
au FileType uml,plantuml nnoremap <F10> :w<CR> :PlantumlOpenSVG<CR>
au FileType uml,plantuml inoremap <F10> <Esc>:w<CR> :PlantumlOpenSVG<CR>
