" ====================================================
"   Copyright (C)2018 All rights reserved.
"
"   Author        : bbxytl
"   Email         : bbxytl@gmail.com
"   File Name     : markdown.vim
"   Last Modified : 2018-12-07 18:30
"   Describe      :
"
" ====================================================


" ###############################
" Markdown
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_no_default_key_mappings=1
" https://github.com/suan/vim-instant-markdown
" npm -g install instant-markdown-d
"
Bundle 'joker1007/vim-markdown-quote-syntax'

" 在tagbar显示目录
Bundle 'lvht/tagbar-markdown'
" 生成 toc
Bundle 'mzlogin/vim-markdown-toc'

""" VIM Table Mode for instant table creation.
" https://github.com/dhruvasagar/vim-table-mode
"""""" Cell Text Object
""""""" Moving around
" Now you can move between cells using table mode motions [|, ]|, {| & }| to
" move left | right | up | down cells respectively.
"""""" Cell Text Object
" Following the vim philosophy the you have i| & a| for the inner and around
" (including the immidiate right table separator) the table cell.
""""" Delete Row
" You can use the <Leader>tdd mapping defined by the option
" g:table_mode_delete_row_map to delete the current table row (provided you
" are within a table row), this can be preceeded with a [count] to delete
" multiple rows just like you would with 'dd'.
""""" Delete Cloumn
" You can use the <Leader>tdc mapping defined by the option
" g:table_mode_delete_column_map to delete the entire current column (provided
" you are within a table row), this can also be preceeded with a [count] to
" delete multiple columns.
Bundle 'dhruvasagar/vim-table-mode'
" use :TableModeToggle mapped to <Leader>tm to enable this plugin
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

let g:table_mode_corner='|'
" au BufNewFile,BufRead * if &filetype ==# "markdown" || &filetype ==# "mk" | exec ":TableModeToggle" | endif
let g:table_mode_always_active = 1
