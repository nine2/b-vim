" ====================================================
"   Copyright (C)2018 All rights reserved.
"
"   Author        : bbxytl
"   Email         : bbxytl@gmail.com
"   File Name     : go.vim
"   Last Modified : 2018-12-07 18:29
"   Describe      :
"
" ====================================================


" ###############################
" Golang
Bundle "fatih/vim-go"
" 此行会导致 C-] 失效, 同时禁用了 go 的 gd 指令，使用上面的 gs 代替
let g:go_def_mapping_enabled = 0
au FileType go nmap gs :<C-u>call go#def#Jump("split")<CR>
au FileType go nnoremap <buffer> <silent> <C-]> :GoDef<cr>
au FileType go nnoremap <buffer> <silent> <leader>s :<C-u>call go#def#Jump("split")<CR>
au FileType go nnoremap <buffer> <silent> <leader>v :<C-u>call go#def#Jump("vsplit")<CR>
au FileType go nnoremap <buffer> <silent> <leader>t :<C-u>call go#def#Jump("tab")<CR>
au FileType go nnoremap <2-LeftMouse> :<C-u>call go#def#Jump("tab")<CR>
" 取消绑定K, 使用 <leader>gd 代替
let g:go_doc_keywordprg_enabled = 0
au FileType go nmap <Leader>d <Plug>(go-doc)
" 运行全部测试函数
func! Nine2GoTest()
   " 需要 vim-rooter 支持
   exe ":ChangeToCurDir"
   echo "Run Testing....."
   echo system('go test -v')
   exe ":Rooter"
endfunc
au FileType go nmap <Leader>tt :call Nine2GoTest()<cr>
" 运行 Benchmarking
func! Nine2GoBench()
   " 需要 vim-rooter 支持
   exe ":ChangeToCurDir"
   echo "Run Benchmarking....."
   echo system('go test -v -bench="."')
   exe ":Rooter"
endfunc
au FileType go nmap <Leader>tb :call Nine2GoBench()<cr>
" 运行光标下的 Test
func! Nine2GoTestFunc()
    exe ":ChangeToCurDir"
    echo system('pwd')
    let test = search('func \(Test\|Example\)', "bcnW")
    if test == 0
        echo "vim-go: [test] no test found immediate to cursor"
        return
    end

    let line = getline(test)
    let name = split(split(line, " ")[1], "(")[0]
    echo "Run Testing ".name." ....."
    echo "go test -v -test.run '".name."'"
    " 防止运行到其他函数
    echo system('go test -v -test.run "'.name.'$"')
    exe ":Rooter"
    echo system('pwd')
endfunc
au FileType go nmap <Leader>tf :call Nine2GoTestFunc()<cr>
au FileType go nmap <F9> :call Nine2GoTestFunc()<CR>
au FileType go nmap <leader><F7> :GoReferrers<cr>

" 自动导入包, 格式化 imports
au FileType go nmap ga :GoAddTag json
au FileType go nmap gaj :GoAddTag json<CR>
au FileType go nmap gar :GoAddTag schema json<CR>
au FileType go nmap gad :GoAddTag db json<CR>
" 保存时自动使用 gofmt 格式代码，使用 goimports 格式 import 部分，
" 同时自动导入缺少的import
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
" 取消每次有错都弹出报错框，如果希望看到所有报错，可使用 :lopen 打开报错框
let g:go_metalinter_enabled = 0
let g:go_list_type = "quickfix"

" Bundle 'nsf/gocode'
Bundle 'stamblerre/gocode'
au FileType go map <C-Z> <C-X><C-O>
Bundle 'Blackrush/vim-gocode'

" ###############################
" vim-shell
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
let g:vimshell_prompt_expr =
        \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

" go debug
Bundle 'sebdah/vim-delve'
" let g:delve_backend = "native"
au FileType go map <leader>bb :DlvAddBreakpoint<cr>
au FileType go map <leader>ba :DlvToggleTracepoint<cr>
au FileType go map <leader>br :DlvRemoveBreakpoint<cr>
" au FileType go map <leader>be :DlvRemoveTracepoint<cr>
au FileType go map <leader>bc :DlvClearAll<cr>
" au FileType go map <leader>bt :DlvTest<cr>
au FileType go map <leader>bd :DlvDebug<cr>

" godoc 类型修改为 go 类型，语法加高亮
au FileType godoc set filetype=go

" 生成 函数 test
" Bundle 'buoto/gotests-vim'
