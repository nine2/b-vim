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
" 保存时自动使用 gofmt 格式代码，使用 goimports 格式 import 部分，
" 同时自动导入缺少的import
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
" 取消每次有错都弹出报错框，如果希望看到所有报错，可使用 :lopen 打开报错框
let g:go_metalinter_enabled = 0
let g:go_list_type = "quickfix"
" let g:go_auto_type_info = 1
let g:go_info_mode = 'gopls'
" let g:go_info_mode = 'gocode'
" let g:go_auto_sameids = 1
" let g:go_updatetime = 300
let g:go_def_mode = 'gopls'
let g:go_decls_mode = 'ctrlp.vim'
let g:go_decls_includes = 'func,type'
let g:go_fold_enable = ['import']
" 此行会导致 C-] 失效, 同时禁用了 go 的 gd 指令，使用下面的 gs 代替
let g:go_def_mapping_enabled = 0
" 取消绑定K, 使用 <leader>gd 代替
let g:go_doc_keywordprg_enabled = 0
" 高亮
let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_operators = 1
" let g:custom_syntax_hightlight_operators= 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

" au FileType go nnoremap <buffer> <silent> gs :<C-u>call go#def#Jump("split")<CR>
au FileType go nnoremap <buffer> <silent> <C-]> :GoDef<cr>

au FileType go nnoremap <buffer> <silent> <leader>s :<C-u>call go#def#Jump("split")<CR>
au FileType go nnoremap <buffer> <silent> <leader>v :<C-u>call go#def#Jump("vsplit")<CR>
au FileType go nnoremap <buffer> <silent> <leader>t :<C-u>call go#def#Jump("tab")<CR>
au FileType go nmap <leader><F7> :GoReferrers<cr>
au FileType go nmap <Space> :GoInfo<cr>
au FileType go nmap <Leader>d :GoDoc<cr>
au FileType go nmap wh :GoSameIds<cr>
au FileType go nmap whc :GoSameIdsClear<cr>

" 自动导入包, 格式化 imports
au FileType go nmap ga :GoAddTag json
au FileType go nmap gaj :GoAddTag json<CR>
au FileType go nmap gar :GoAddTag schema json<CR>
au FileType go nmap gad :GoAddTag db json<CR>

au FileType go nmap <Leader>tt :call Nine2GoTest()<cr>
au FileType go nmap <Leader>tb :call Nine2GoBench()<cr>
au FileType go nmap <Leader>tf :call Nine2GoTestFunc()<cr>
au FileType go nmap <F9> :call Nine2GoTestFunc()<CR>
au FileType go nmap <leader><F9> :call Nine2GoBenchmarkFunc()<CR>
" 运行全部测试函数
func! Nine2GoTest()
   " 需要 vim-rooter 支持
   exe ":ChangeToCurDir"
   echo "Run Testing CurFile ....."
   echo system('go test -v -benchmem')
   exe ":Rooter"
endfunc
" 运行 Benchmarking
func! Nine2GoBench()
   " 需要 vim-rooter 支持
   exe ":ChangeToCurDir"
   echo "Run Benchmarking CurFile ....."
   echo "函数名字  循环次数  (ns/op)平均每次执行时间  (b/op)每个操作分配字节  （allocs/op)每个操作分配内存"
   echo system('go test -v -benchmem -bench="."')
   exe ":Rooter"
endfunc
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
" 运行光标下的 Benchmarking
func! Nine2GoBenchmarkFunc()
    exe ":ChangeToCurDir"
    echo system('pwd')
    let bench = search('func \(Benchmark\|Example\)', "bcnW")
    if bench == 0
        echo "vim-go: [test] no benchmark found immediate to cursor"
        return
    end

    let line = getline(bench)
    let name = split(split(line, " ")[1], "(")[0]
    echo "Run Benchmarking ".name." ....."
    " echo 'go test -v -benchmem -test.bench '.name."'"
    echo 'go test -v -benchmem -test.bench "'.name.'$"'
    " 防止运行到其他函数
    echo "函数名字  循环次数  (ns/op)平均每次执行时间  (b/op)每个操作分配字节  （allocs/op)每个操作分配内存"
    echo system('go test -v -benchmem -test.bench "'.name.'$"')
    exe ":Rooter"
    echo system('pwd')
endfunc

" Bundle 'nsf/gocode'
" Bundle 'stamblerre/gocode'
" 使用了 YCM, 这个就不需要用了，YCM 里使用的是这个
" Bundle 'mdempsky/gocode'
" au FileType go map <C-Z> <C-X><C-O>
" Bundle 'Blackrush/vim-gocode'

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
Bundle 'buoto/gotests-vim'
let g:gotests_bin = expand('$HOME/go/bin/gotests')
au FileType go map <leader>T :GoTests<cr>

" au FileType go let g:nerdtree_tabs_open_on_console_startup = 1

Bundle 'tenfyzhong/golint-fixer.vim'
" let g:golint_fixer_use_default_mapping = 1
" Default: 1
" Map <leader>lf to fix warning.
" let g:golint_fixer_use_go_rename = 1
" Default: 1
" Use :GoRename to rename identify if usable.

