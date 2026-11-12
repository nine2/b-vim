" ====================================================
"   Copyright (C)2018 All rights reserved.
"
"   Author        : bbxytl
"   Email         : bbxytl@gmail.com
"   File Name     : dependout.vim
"   Last Modified : 2023-01-29 12:29
"   Describe      :
"               依赖外部工具的插件, 每个插件必须写上需要依赖的部分，最好给出 githbub url
" ====================================================


" ##### Asynchronous & mutithreading translating
" https://github.com/nine2/vim-translator
""" Configuration example
Plug 'nine2/vim-translator'
" Echo translation in the cmdline
" 2026-11-12：由 <Leader>t 改为 <Leader>y（译），<Leader>t 前缀整体让给 vim-table-mode
"（<Leader>tr 重排 / <Leader>tt 表格化），避免按 <Leader>tr 时落到翻译 + r 替换字符
nmap <silent> <Leader>y <Plug>Translate
vmap <silent> <Leader>y <Plug>TranslateV
" 实测仅 haici 可用（google 超时、bing/youdao 返回空），只用它避免每次等超时；仅支持查单词
let g:translator_default_engines = ['haici']
" Display translation in a window
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <Leader>x <Plug>TranslateX
let g:translator_window_max_width = 100
" Once the translation window is opened, type <C-w>p to jump into it and again to jump back
""""""
" :Translate                                  " translate the word under the cursor
" :Translate --engines=google,youdao are you ok " translate text `are you ok` using google and youdao engines
" :2Translate ...                             " translate line 2
" :1,3Translate ...                           " translate line 1 to line 3
" :'<,'>Translate ...                         " translate selected lines
"""""
" :TranslateX[!] [--engines=ENGINES] [--target_lang=TARGET_LANG] [--source_lang=SOURCE_LANG] [your text]
" Translate the text in the clipboard
"""""
" :TranslateH
" Export the translation history
"""""
" :TranslateL
" Display log message
"""""
" Text highlight of translator window
hi def link TranslatorQuery             Identifier
hi def link TranslatorDelimiter         Special
hi def link TranslatorExplain           Statement
" Background of translator window border
hi def link Translator                  Normal
hi def link TranslatorBorder            NormalFloat


