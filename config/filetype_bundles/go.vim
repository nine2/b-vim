" ====================================================
"   Copyright (C)2018 All rights reserved.
"
"   Author        : bbxytl
"   Email         : bbxytl@gmail.com
"   File Name     : go.vim
"   Last Modified : 2026-04-24 17:28
"   Describe      :
"
" ====================================================

" go 文件配置
autocmd BufRead,BufNewFile *.go set filetype=go
" 恢复 CompleteParameter 在 Go 文件下的 ( hook 能力（之前因"Python 解析失败"关过，
" 现在重新启用；如再遇解析失败问题，可临时 :iunmap ( 退回普通括号）
autocmd FileType go setlocal foldmethod=manual    " 避免每次按键重算全文折叠，大文件性能关键
autocmd FileType go setlocal nocursorline         " 关闭当前行高亮，减少光标移动时的重绘开销
autocmd FileType go setlocal norelativenumber     " 固定绝对行号，消除进出 insert 时全屏行号重绘
" 保存前临时关闭 copyright 自动更新，写完再恢复，避免 Go 文件保存时扫描修改文件头
autocmd BufWritePre  *.go let g:file_copyright_auto_update = 0
autocmd BufWritePost *.go let g:file_copyright_auto_update = 1
" Go 文件关闭 echodoc，减少光标移动时 cmdline 重绘
autocmd FileType go let b:echodoc_enabled = 0

" ###############################
" Golang
" vim-go 通过软链 bundle/vim-go → bundle/vim-go.250925 + 在 vimrc.bundles_base
" 末尾 set rtp+= 加载，不纳入 vim-plug 管理（避免 :PlugClean 误删软链）
" Plug 'fatih/vim-go'
" 保存时自动使用 gofmt 格式代码，使用 goimports 格式 import 部分，
" 同时自动导入缺少的import
let g:go_fmt_command = "gofmt"              " gopls 与 YCM ycmd 争用连接会 timeout；gofmt 轻量无阻塞
" --- 关 vim-go 同步 autosave：BufWritePre 跑 goimports 实测 ~1.1s 阻塞 :w ---
" --- 改由 ALE fix_on_save 异步处理（见 vimrc.bundles_base 的 ale_fixers 设置）---
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_metalinter_autosave = 0
let g:go_asmfmt_autosave = 0
let g:go_mod_fmt_autosave = 0
au FileType go nmap <leader>gi :GoImports<CR>  " 手动整理 import
" 取消每次有错都弹出报错框，如果希望看到所有报错，可使用 :lopen 打开报错框
let g:go_fmt_fail_silently = 1
" let g:go_metalinter_enabled = 0
" 需要安装 golangci-lint: go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
" 命令 :GoMetaLinter
let g:go_metalinter_command = "golangci-lint"
" Use this option to auto :GoMetaLinter on save.
" let g:go_metalinter_autosave = 1
let g:go_list_type = "quickfix"
" let g:go_auto_type_info = 1
let g:go_auto_type_info = 0
let g:go_info_mode = 'gopls'
" let g:go_info_mode = 'gocode'
" let g:go_auto_sameids = 1
let g:go_updatetime = 1500          " 原 300ms，降低 gopls CursorHold 轮询频率
" go 文件不再走 YCM（见 vimrc.bundles_ycm 的 ycm_filetype_whitelist），
" 开 popup 让 :GoDoc 承担 hover 角色（gh 映射见下）
let g:go_doc_popup_window = 1
let g:go_def_mode = 'gopls'
" let g:go_def_mode = 'godef'
let g:go_gopls_complete_unimported = 1
let g:go_decls_mode = 'ctrlp.vim'
let g:go_decls_includes = 'func,type'
let g:go_fold_enable = ['import']
" 原为 0，把 C-]/gd 让给 YCM；go 文件不再用 YCM，改回 vim-go 自己的 gopls 跳转
let g:go_def_mapping_enabled = 1
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

" === Go syntax 颜色微调 ===
" molokai 主题有 Field group（#00afaf 青绿加粗），但 vim-go 的 goField 默认未 link 到它
" 用 ColorScheme/Syntax 双钩子确保 colorscheme reload 或 .go buffer 进入时都能生效
" （本文件在 colorscheme molokai 之前被 source，直接 hi link 会被覆盖，必须走 autocmd）
augroup go_color_fix
    autocmd!
    autocmd ColorScheme,Syntax * highlight! link goField Field
augroup END
" 无 model 不报警
let g:go_null_module_warning = 0

" 修改补全触发
inoremap <C-n> <C-x><C-o>

" ###############################
" 补全弹窗（替代 YCM 对 go 的补全）
" asyncomplete.vim 本体 + asyncomplete-omni.vim（omni source，核心包不内置，
" 需单独装）；不装 asyncomplete-lsp.vim，不额外起 LSP client——
" 补全数据直接走 vim-go 自己已经设置好的 omnifunc=go#complete#Complete
" （其内部调用 go#lsp#Completion，用的是 vim-go 自身维护的那一个 gopls 连接），
" 物理上不存在第二个 gopls 进程，也就无需依赖 g:go_gopls_options 的
" -remote=auto 共享机制去"去重"。
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
let g:asyncomplete_auto_popup = 1
au FileType go call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \ 'name': 'go-gopls',
    \ 'whitelist': ['go'],
    \ 'completor': function('asyncomplete#sources#omni#completor'),
    \ }))

" au FileType go nnoremap <buffer> <silent> gs :<C-u>call go#def#Jump("split")<CR>
" au FileType go nnoremap <buffer> <silent> <C-]> :GoDef<cr>

au FileType go nnoremap <buffer> <silent> <leader>s :<C-u>call go#def#Jump("split")<CR>
au FileType go nnoremap <buffer> <silent> <leader>v :<C-u>call go#def#Jump("vsplit")<CR>
" au FileType go nnoremap <buffer> <silent> <leader>t :<C-u>call go#def#Jump("tab")<CR>
" 使用 ycm 的配置
au FileType go nnoremap ff :GoDef<CR>
au FileType go nnoremap <2-LeftMouse> :GoDef<CR>
au FileType go nnoremap fi :GoImplements<CR>
au FileType go nnoremap <F6> :GoImplements<CR>:cfirst<CR>
au FileType go nnoremap fr :GoReferrers<CR>
" go 文件下, F8 不做 Format 使用, go 有自己的 fmt
au FileType go nnoremap <F8> :GoReferrers<CR>
" 自动导入结构体字段
au FileType go nnoremap fs :GoFillStruct<cr>
" au FileType go nmap <leader><F7> :GoReferrers<cr>
" GoInfo 用 gy（go type info）；vim 内置 gy 完全空闲，避开 <Space>/<leader> 等待 timeout
au FileType go nmap gy :GoInfo<cr>
au FileType go nmap <Leader>d :GoDoc<cr>
" gh：go 文件下的 hover，替代原来落在这个键上的 YCMHover（其它文件类型 gh 仍走 YCM，见 vimrc.bundles_ycm）
au FileType go nmap gh :GoDoc<cr>
" SameIds 配色： hi CursorColumn ctermbg=26
au FileType go nmap wh :GoSameIds<cr>
au FileType go nmap whc :GoSameIdsClear<cr>
au FileType go map <leader>rn :GoRename<cr>

" 自动导入包, 格式化 imports
au FileType go nmap ga :GoAddTag json
au FileType go nmap gaj :GoAddTag json<CR>
au FileType go nmap gas :GoAddTag schema<CR>
au FileType go nmap gad :GoAddTag db<CR>
au FileType go nmap grt :GoRemoveTags db
au FileType go nmap grj :GoRemoveTags json<CR>
au FileType go nmap grd :GoRemoveTags db<CR>

" go build 检查错误
au FileType go nmap <Leader>e :GoBuild<cr>
au FileType go nmap <Leader>gb :GoBuild<cr>
au FileType go nmap cl :GoMetaLinter<cr>
au FileType go nmap <F10> :GoMetaLinter<CR>
au FileType go nmap <silent> ek :cprevious<cr>
au FileType go nmap <silent> ej :cnext<cr>
au FileType go nmap <silent> eh :cr<cr>
au FileType go nmap <silent> el :cla<cr>
" 运行测试函数
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


"" 语言高亮配色
hi def link   goSimpleParams      FunctionArgument
hi def link   goParamName         FunctionArgument
hi def link   goBuiltins          Builtins
hi def link   goField             Field
hi def link   goSameId            SameId

" Bundle 'nsf/gocode'
" Bundle 'stamblerre/gocode'
" 使用了 YCM, 这个就不需要用了，YCM 里使用的是这个
" Bundle 'mdempsky/gocode'
" au FileType go map <C-Z> <C-X><C-O>
" Bundle 'Blackrush/vim-gocode'

" ###############################
" vim-shell
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell.vim'
let g:vimshell_prompt_expr =
        \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

" go debug
Plug 'sebdah/vim-delve'
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
Plug 'buoto/gotests-vim'
let g:gotests_bin = expand('$HOME/go/bin/gotests')
au FileType go map <leader>gt :GoTests<cr>

" au FileType go let g:nerdtree_tabs_open_on_console_startup = 1

Plug 'tenfyzhong/golint-fixer.vim'
" let g:golint_fixer_use_default_mapping = 1
" Default: 1
" Map <leader>lf to fix warning.
" let g:golint_fixer_use_go_rename = 1
" Default: 1
" Use :GoRename to rename identify if usable.

