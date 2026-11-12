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
    " 不折行（与全局 set nowrap 一致）：Vim 折行不认表格列，宽表格一折就错乱，
    " 无法做到"折行且列宽对齐"；读长段落时按 <F4>（vimrc.config_base）临时切换 wrap。
    " linebreak / breakindent 只在 wrap 打开时生效，保留以便 <F4> 后按词折行、保持缩进
    autocmd FileType markdown setlocal conceallevel=2 concealcursor= nowrap linebreak breakindent
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
    " 标题的 # 与同级标题同色（分组定义见 after/syntax/markdown.vim）
    hi link mdH1Mark htmlH1
    hi link mdH2Mark htmlH2
    hi link mdH3Mark htmlH3
    hi link mdH4Mark htmlH4
    hi link mdH5Mark htmlH5
    hi link mdH6Mark htmlH6
    hi mkdHeading guifg=#F92672 ctermfg=197 gui=bold cterm=bold
    hi htmlBold         guifg=#87D7FF ctermfg=117 gui=bold cterm=bold
    hi htmlItalic       guifg=#F4BFD0 ctermfg=218 gui=italic cterm=italic
    hi htmlBoldItalic   guifg=#87D7FF ctermfg=117 gui=bold,italic cterm=bold,italic
    hi mkdStrike        guifg=#75715E ctermfg=242 gui=strikethrough cterm=strikethrough
    hi mkdCode          guifg=#A6E22E ctermfg=148 guibg=#2D2F2A ctermbg=236
    hi mkdCodeDelimiter guifg=#5C5F5A ctermfg=240
    hi mkdCodeStart     guifg=#5C5F5A ctermfg=240
    hi mkdCodeEnd       guifg=#5C5F5A ctermfg=240
    hi mkdLink          guifg=#66D9EF ctermfg=81 gui=underline cterm=underline
    hi mkdInlineURL     guifg=#66D9EF ctermfg=81 gui=underline cterm=underline
    hi mkdURL           guifg=#75715E ctermfg=242
    " 引用：> 换成左侧竖条，正文用浅暖色 + 斜体（原 247 灰色太淡）
    hi mkdBlockquote    guifg=#E6DB74 ctermfg=187 gui=italic cterm=italic
    " 表格：竖线 / 分隔行用钢蓝色勾出框线，表头加粗青色
    hi mdTablePipe      guifg=#5FAFFF ctermfg=75 gui=bold cterm=bold
    hi mdTableSep       guifg=#5FAFFF ctermfg=75 gui=bold cterm=bold
    " 分隔线 --- ：conceal 掉原文后用虚拟文本画一条横贯窗口的细线
    hi mdRuleLine       guifg=#AE81FF ctermfg=141
    " YAML front matter 首尾的 ---（只高亮这三个横杠，不画横线）
    hi mdFrontMatterDelim guifg=#AE81FF ctermfg=141 gui=bold cterm=bold
    hi mdTableHead      guifg=#66D9EF ctermfg=81 gui=bold cterm=bold
    hi mdTableRow       guifg=#F8F8F2 ctermfg=252
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

" ---- 标题标签：# 被 conceal 隐藏后，用 Vim 9 虚拟文本在行首显示级别图标 ----
" 默认 ➊~➏（单码点、Vim 与 iTerm2 宽度一致），颜色随对应级别标题；
" 不用 1️⃣ 这类 keycap emoji：它由 3 个码点组成，Vim 算 1 格、终端画 2 格，会错位。
" 想换成文字可在 ~/.vimrc.local 里设置：
"   let g:md_heading_labels = ['H1', 'H2', 'H3', 'H4', 'H5', 'H6']
" 光标所在行不显示标签（与 concealcursor= 一致，显示原文 ## 便于编辑）
" 分隔线 --- / *** / ___ 复用同一机制：级别记为 7，画一条横贯窗口的 ─ 线
let s:md_label_types = map(range(1, 6), '"mdHLabel" . v:val') + ['mdRuleLabel']
function! s:MdLabelInit() abort
    for l:n in range(1, 6)
        if empty(prop_type_get(s:md_label_types[l:n - 1]))
            call prop_type_add(s:md_label_types[l:n - 1], {'highlight': 'mdH' . l:n . 'Mark'})
        endif
    endfor
    if empty(prop_type_get('mdRuleLabel'))
        call prop_type_add('mdRuleLabel', {'highlight': 'mdRuleLine'})
    endif
endfunction

" 返回某行的装饰类型：1~6 = 标题级别，7 = 分隔线，0 = 无；代码块内的行由调用方跳过
" 分隔线额外校验语法组为 mkdRule，避免把 setext 二级标题的 --- 下划线当分隔线
function! s:MdHeadLevel(line, ...) abort
    let l:m = matchstr(a:line, '^\s*\zs#\{1,6}\ze\s')
    if !empty(l:m)
        return len(l:m)
    endif
    if a:0 && a:line =~# '^\s*\([-*_]\)\%(\s*\1\)\{2,}\s*$'
                \ && synIDattr(synID(a:1, match(a:line, '\S') + 1, 1), 'name') ==# 'mkdRule'
        return 7
    endif
    return 0
endfunction

function! s:MdLabelLine(lnum, level) abort
    if a:level < 1 || a:lnum == line('.') || &conceallevel < 2
        return
    endif
    if a:level == 7
        let l:width = winwidth(0) - getwininfo(win_getid())[0].textoff - 1
        call prop_add(a:lnum, 1, {'type': 'mdRuleLabel', 'text': repeat('─', max([l:width, 3]))})
        return
    endif
    let l:labels = get(g:, 'md_heading_labels', ['➊', '➋', '➌', '➍', '➎', '➏'])
    let l:col = match(getline(a:lnum), '#') + 1
    call prop_add(a:lnum, l:col, {'type': s:md_label_types[a:level - 1], 'text': l:labels[a:level - 1]})
endfunction

" 全量刷新：跳过 ``` / ~~~ 围起来的代码块，避免把 shell 注释当标题
function! s:MdLabelRefresh() abort
    if &filetype !=# 'markdown' | return | endif
    call s:MdLabelInit()
    call prop_remove({'types': s:md_label_types, 'all': 1, 'bufnr': bufnr()})
    let l:in_code = 0
    let l:lnum = 0
    for l:line in getline(1, '$')
        let l:lnum += 1
        if l:line =~# '^\s*\(```\|\~\~\~\)'
            let l:in_code = !l:in_code
            continue
        endif
        if !l:in_code
            call s:MdLabelLine(l:lnum, s:MdHeadLevel(l:line, l:lnum))
        endif
    endfor
    let b:md_label_cur = line('.')
endfunction

" 光标换行：旧行补回标签、新行去掉标签（增量，不全量扫描）
function! s:MdLabelCursor() abort
    if &filetype !=# 'markdown' | return | endif
    let l:cur = line('.')
    let l:old = get(b:, 'md_label_cur', l:cur)
    if l:old == l:cur | return | endif
    let b:md_label_cur = l:cur
    call prop_remove({'types': s:md_label_types, 'all': 1, 'bufnr': bufnr()}, l:cur)
    if l:old <= line('$') && synIDattr(synID(l:old, 1, 1), 'name') !~# 'mkdCode\|mkdSnippet'
        call prop_remove({'types': s:md_label_types, 'all': 1, 'bufnr': bufnr()}, l:old)
        call s:MdLabelLine(l:old, s:MdHeadLevel(getline(l:old), l:old))
    endif
endfunction

if exists('*prop_add') && has('patch-9.0.0067')
    augroup md_heading_labels
        autocmd!
        autocmd BufWinEnter,InsertLeave,TextChanged,VimResized,WinResized * call s:MdLabelRefresh()
        autocmd FileType markdown call s:MdLabelRefresh()
        autocmd CursorMoved,CursorMovedI * call s:MdLabelCursor()
    augroup END
endif
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
" always_active=1 时 table-mode 不会注册 buffer 级快捷键（只在 TableModeEnable 里注册），
" 导致 <Leader>tr 落到 <Leader>t（翻译）+ r（替换字符）。这里给 markdown 手动补上：
"   <Leader>tr 重排当前表格（等价 :TableModeRealign）
augroup md_table_mode_maps
    autocmd!
    autocmd FileType markdown nmap <buffer> <Leader>tr <Plug>(table-mode-realign)
augroup END
