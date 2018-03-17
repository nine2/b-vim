" ###### 配置自己当前项目的特殊vim 配置
"  一般要配合插件：vim-rooter，本配置文件中已包含
"  使用方法，将此配置文件copy 到要使用的项目目录下，
"  并更名为 .workspace.vim  即可
"  或使用本配置的 shell 配置，加载后使用命令：proconf 即可，
"  命令可参见 bash_alias.sh 文件

" 下面的两个 let 是关闭 语法检测
"	关闭syntastic 对 c 类型文件的语法检测
" let g:syntastic_c_checkers = [ ]
"	关闭 ycm 的语法检测
" let g:ycm_show_diagnostics_ui = 0

" let g:extra_whitespace_ignored_filetypes += ['c', 'cpp', 'py', 'python']
" 关闭 syntastic 的相应文件的语法检测
" let g:syntastic_ignore_files=[".*\.c$", ".*\.decl$"]
" let g:ag_prg="ag -w --column --nogroup --noheading --ignore-dir tmp --ignore-dir tools --ignore *.txt --ignore *.md --ignore tags"
" let g:ag_prg="ag -w --column --nogroup --noheading --ignore-dir tmp --ignore *.txt --ignore tags"
" 设置头文件路径
" set path+=,/Users/xxx/data/git/engine/**
" 设置 tags
" set tags+=/Users/xxx/data/git/engine/tags

" 设置系统 tags
" set tags+=~/$VIM_TMP_PATH/systags
" set tags+=~/$VIM_TMP_PATH/systags_local
"
" 设置第三方库的 tags
" set tags+=

" 标签映射
" 生成系统 头文件的 tags
" set tags+=~/.vim/systags
" set tags+=~/.vim/systags_local

" 将此行加入文件首行，可以直接设置文件类型
" /* vim: set filetype=vim : */
