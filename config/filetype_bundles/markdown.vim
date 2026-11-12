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
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_no_default_key_mappings=1
" ---- 编辑态美化（2026-11-12）：隐藏标记 + 分级配色，接近 Obsidian Live Preview ----
let g:vim_markdown_conceal = 1                 " 隐藏 ** _ []() 等标记
let g:vim_markdown_conceal_code_blocks = 0     " 保留 ``` 便于看代码块边界
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_fenced_languages = ['go', 'bash=sh', 'sh', 'python', 'json', 'yaml', 'sql', 'vim', 'js=javascript']

augroup md_pretty
    autocmd!
    " concealcursor 置空：光标所在行显示原文，其余行显示美化效果
    autocmd FileType markdown setlocal conceallevel=2 concealcursor= wrap linebreak breakindent
augroup END
" 列表符号 → •，复选框 → ☐ / ☑：放在 $VIM_CONFIG_PATH/after/syntax/markdown.vim
" （plug#end 会重注册 syntax autocmd，写在 Syntax 事件里会被 vim-markdown 的 syn clear 冲掉）
set rtp+=$VIM_CONFIG_PATH/after

" 分级配色：取 molokai 调色板，gui（truecolor）+ cterm（256 色兜底）双写
function! s:MdHighlight() abort
    hi htmlH1 guifg=#F92672 ctermfg=197 gui=bold cterm=bold
    hi htmlH2 guifg=#FD971F ctermfg=208 gui=bold cterm=bold
    hi htmlH3 guifg=#E6DB74 ctermfg=186 gui=bold cterm=bold
    hi htmlH4 guifg=#A6E22E ctermfg=148 gui=bold cterm=bold
    hi htmlH5 guifg=#66D9EF ctermfg=81  gui=bold cterm=bold
    hi htmlH6 guifg=#AE81FF ctermfg=141 gui=bold cterm=bold
    hi mkdHeading       guifg=#5C5F5A ctermfg=240
    hi htmlBold         guifg=#FFFFFF ctermfg=231 gui=bold cterm=bold
    hi htmlItalic       guifg=#F4BFD0 ctermfg=218 gui=italic cterm=italic
    hi htmlBoldItalic   guifg=#FFFFFF ctermfg=231 gui=bold,italic cterm=bold,italic
    hi mkdStrike        guifg=#75715E ctermfg=242 gui=strikethrough cterm=strikethrough
    hi mkdCode          guifg=#A6E22E ctermfg=148 guibg=#2D2F2A ctermbg=236
    hi mkdCodeDelimiter guifg=#5C5F5A ctermfg=240
    hi mkdCodeStart     guifg=#5C5F5A ctermfg=240
    hi mkdCodeEnd       guifg=#5C5F5A ctermfg=240
    hi mkdLink          guifg=#66D9EF ctermfg=81 gui=underline cterm=underline
    hi mkdInlineURL     guifg=#66D9EF ctermfg=81 gui=underline cterm=underline
    hi mkdURL           guifg=#75715E ctermfg=242
    hi mkdBlockquote    guifg=#A8A595 ctermfg=247 gui=italic cterm=italic
    hi mkdRule          guifg=#5C5F5A ctermfg=240
    hi mkdListItem      guifg=#FD971F ctermfg=208
    hi mdBullet         guifg=#FD971F ctermfg=208
    hi mdTodo           guifg=#F92672 ctermfg=197
    hi mdDone           guifg=#A6E22E ctermfg=148
    hi Conceal          guifg=#FD971F ctermfg=208 guibg=NONE ctermbg=NONE
endfunction
augroup md_colors
    autocmd!
    autocmd ColorScheme * call s:MdHighlight()
    autocmd FileType markdown call s:MdHighlight()
augroup END
" https://github.com/suan/vim-instant-markdown
" npm -g install instant-markdown-d
"
Plug 'joker1007/vim-markdown-quote-syntax'

" 在tagbar显示目录
Plug 'lvht/tagbar-markdown'
" 生成 toc
Plug 'mzlogin/vim-markdown-toc'

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
Plug 'dhruvasagar/vim-table-mode'
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
