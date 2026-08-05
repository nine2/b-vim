# Vim 快捷键速查表

**生成日期**: 2026-05-08
**总数**: 294 个映射（含 nmap/imap/vmap/smap/map + 变量配置式）
**全局映射**: 234（不含 buffer-local 的 FileType 限定项）

> **mode 列说明**：N=normal, I=insert, V=visual, S=select, C=cmdline；buf=buffer-local
> **leader 设置**：`<leader>` = `<Space>`（vimrc:13）

---

## 一、全局快捷键（按字母排序）

> 排序键：`<leader>X` 取 X，`gd` 取 g，`<F8>` 排到最后。说明列优先取上方注释，否则查命令字典。

| 按键 | 模式 | 说明 | 命令 | 来源 |
|------|:----:|------|------|------|
| `#` | N sil | 即 `#zz` | `#zz` | `vimrc.config_base:419` |
| `#` | N | switch # * | `*` | `vimrc.config_base:422` |
| `'` | N | Swap implementations of ` and ' jump to markers / By defa... | ``` | `vimrc.config_base:499` |
| `*` | N sil | 即 `*zz` | `*zz` | `vimrc.config_base:418` |
| `*` | N | 即 `#` | `#` | `vimrc.config_base:423` |
| `<leader>,` |  | 清除尾部空白 | `:FixWhitespace<cr>` | `vimrc.bundles_base:175` |
| `,,` | I | ,, 替换 Esc | `<Esc>` | `vimrc:16` |
| `,d` | V | 即 `"+d` | `"+d` | `vimrc.config_base:561` |
| `,P` | N | 即 `"+p` | `"+p` | `vimrc.config_base:564` |
| `,P` | V | 即 `"+P` | `"+P` | `vimrc.config_base:566` |
| `,p` | N | 设置快捷键将系统剪贴板内容粘贴至 vim | `"+p` | `vimrc.config_base:563` |
| `,p` | V | 即 `"+p` | `"+p` | `vimrc.config_base:565` |
| `,y` | N | 设置快捷键将选中文本块复制至系统剪贴板 | `"+y` | `vimrc.config_base:559` |
| `,y` | V | 即 `"+y` | `"+y` | `vimrc.config_base:560` |
| `<leader>-` |  | 关闭当前 tab | `:tabclose<cr>` | `vimrc.config_base:464` |
| `<leader>0` |  | 最后一个 tab | `:tablast<cr>` | `vimrc.config_base:462` |
| `<leader>1` |  | normal模式下切换到确切的tab | `1gt` | `vimrc.config_base:453` |
| `<leader>2` |  | 即 `2gt` | `2gt` | `vimrc.config_base:454` |
| `<leader>3` |  | 即 `3gt` | `3gt` | `vimrc.config_base:455` |
| `<leader>4` |  | 即 `4gt` | `4gt` | `vimrc.config_base:456` |
| `<leader>5` |  | 即 `5gt` | `5gt` | `vimrc.config_base:457` |
| `<leader>6` |  | 即 `6gt` | `6gt` | `vimrc.config_base:458` |
| `<leader>7` |  | 即 `7gt` | `7gt` | `vimrc.config_base:459` |
| `<leader>8` |  | 即 `8gt` | `8gt` | `vimrc.config_base:460` |
| `<leader>9` |  | 即 `9gt` | `9gt` | `vimrc.config_base:461` |
| `;` | N | 将 ; 绑定到 : 用于快速进入命令行 | `:` | `vimrc:19` |
| `<leader>=` |  | 执行 :tabedit | `:tabedit<cr>` | `vimrc.config_base:463` |
| `>` | V | 即 `>gv` | `>gv` | `vimrc.config_base:476` |
| `[[` | N buf sil | 执行 :silent | `:silent! call <SID>section('b')<cr>` | `autoload/plug.vim:910` |
| `[b` | N | ##### tab/buffer相关 / :b1 :b2   :bf :bl | `:bprevious<cr>` | `vimrc.config_base:430` |
| `<leader>\` |  | 调用：CtrlsfViewMode() | `:call CtrlsfViewMode()<cr>` | `vimrc.bundles_base:499` |
| `\` | N | Plug 触发：CtrlSFCwordPath | `<Plug>CtrlSFCwordPath<CR>` | `vimrc.bundles_base:500` |
| `\\` | N | 使用 normal 方式搜索 | `:let g:ctrlsf_default_view_mode_last = g:ctrlsf_default_view_mode<CR> :let g:...` | `vimrc.bundles_base:503` |
| `]]` | N buf sil | 执行 :silent | `:silent! call <SID>section('')<cr>` | `autoload/plug.vim:909` |
| `]b` | N | 下一个 buffer | `:bnext<cr>` | `vimrc.config_base:431` |
| ``` | N | 即 `'` | `'` | `vimrc.config_base:500` |
| `<leader>a` | N | Ag 默认查找当前单词，可修改, 不立刻查询 / nmap <leader>a :Ag <c-r>=expand(... | `:Ag '` | `vimrc.bundles_base:521` |
| `<leader>aa` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>'<cr>` | `vimrc.bundles_base:508` |
| `<leader>ag` | N | 查询当前单词, 立刻查询 | `:Ag -w <c-r>=expand("<cword>")<cr><cr>` | `vimrc.bundles_base:518` |
| `ag` | N | nmap <F7> :Ag -w <c-r>=expand("<cword>")<cr><cr> / 查找函数调用 | `:Ag -w <c-r>=expand("<cword>")<cr> \\| grep '<c-r>=expand("<cword>")<cr>('<cr>` | `vimrc.bundles_base:516` |
| `bd` | N | 关闭当前 buffer | `:bdelete<cr>` | `vimrc.config_base:434` |
| `bj` | N | 上一个 buffer | `:bprevious<cr>` | `vimrc.config_base:432` |
| `bk` | N | 下一个 buffer | `:bnext<cr>` | `vimrc.config_base:433` |
| `bw` | N | 执行 :bwipeout | `:bwipeout<cr>` | `vimrc.config_base:435` |
| `ca` | N | quickfix 跳指定项 | `:cr<cr>` | `vimrc.config_base:743` |
| `cc` | N | 关闭 quickfix 窗口 | `:cclose<cr>` | `vimrc.config_base:742` |
| `<leader>cd` | N | 执行 :AutoChangeDirectory | `:AutoChangeDirectory <cr>` | `vimrc.bundles_base:162` |
| `ce` | N | quickfix 显示全部 | `:cla<cr>` | `vimrc.config_base:744` |
| `<Leader>ch` | N | 执行 :AS | `:AS<CR>` | `filetype_bundles/cpp.vim:18` |
| `cj` | N | quickfix 下一个 | `:cnext<cr>` | `vimrc.config_base:740` |
| `ck` | N | quickfix 上一个 | `:cprevious<cr>` | `vimrc.config_base:741` |
| `co` | N | Quick | `:copen<cr>` | `vimrc.config_base:739` |
| `<Leader>cp` | N | 开关 AI 自动补全（替代已禁用的 Copilot，后端 ModelScope/Qwen3-Coder） | `:AICompleteToggle<CR>` | `vimrc.bundles_complex:124` |
| `<C-l>` | I | 接受 AI 补全建议（不受 pum 开关影响；<C-y> 会被 Vim 内置 pum 确认键截走所以不用） | `ai_complete#Accept()` | `vimrc.bundles_complex:121` |
| `cq` | N sil | 适用：在主代码 buffer 中按 :GoReferrers / :GoBuild 后弹出 quickfix， /... | `:cclose<bar>lclose<bar>pclose<CR>` | `vimrc.bundles_base:790` |
| `D` | N buf sil | 执行 :PlugDiff | `:PlugDiff<cr>` | `autoload/plug.vim:905` |
| `d` | N buf sil | 执行 :set | `:set opfunc=<sid>delete_op<cr>g@` | `autoload/plug.vim:2532` |
| `d` | V buf sil | — | `:<c-u>call <sid>delete_op(visualmode(), 1)<cr>` | `autoload/plug.vim:2534` |
| `dd` | N buf sil | 即 `d_` | `d_` | `autoload/plug.vim:2533` |
| `<leader>ds` |  | 在 Dash 中查文档 | `:Dash<cr>` | `vimrc.bundles_complex:60` |
| `<leader>e` | N | 执行 :YcmDiags | `:YcmDiags<CR>` | `vimrc.bundles_ycm:82` |
| `eh` | N sil | Plug 触发：ale_first | `<Plug>(ale_first)` | `vimrc.bundles_base:256` |
| `ej` | N sil | Plug 触发：ale_next_wrap | `<Plug>(ale_next_wrap)` | `vimrc.bundles_base:255` |
| `ek` | N sil | Plug 触发：ale_previous_wrap | `<Plug>(ale_previous_wrap)` | `vimrc.bundles_base:254` |
| `el` | N sil | Plug 触发：ale_last | `<Plug>(ale_last)` | `vimrc.bundles_base:257` |
| `er` | N | 执行 :e | `:e<CR>` | `vimrc.config_base:494` |
| `<leader>ev` | N sil | Quickly edit/reload the vimrc file | `:e $MYVIMRC<CR>` | `vimrc.config_base:505` |
| `f` |  | 调用：ShowFuncName() | `:call ShowFuncName() <CR>` | `vimrc.config_base:730` |
| `ff` | N | 定位当前函数、变量的定义处 | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | `vimrc.bundles_ycm:73` |
| `fh` |  | let g:EasyMotion_startofline = 0 " keep cursor colum when... | `<Plug>(easymotion-linebackward)` | `vimrc.bundles_base:287` |
| `<leader>fi` | N | YouCompleteMe 命令 | `:YcmCompleter GoToImplementation<CR>` | `vimrc.bundles_ycm:75` |
| `fi` | N | YouCompleteMe 命令 | `:YcmCompleter GoToImplementation<CR>` | `vimrc.bundles_ycm:74` |
| `fj` |  | Plug 触发：easymotion-e | `<Plug>(easymotion-e)` | `vimrc.bundles_base:289` |
| `fk` |  | Plug 触发：easymotion-b | `<Plug>(easymotion-b)` | `vimrc.bundles_base:290` |
| `fl` |  | Plug 触发：easymotion-lineforward | `<Plug>(easymotion-lineforward)` | `vimrc.bundles_base:291` |
| `<leader>fr` | N | YouCompleteMe 命令 | `:YcmCompleter GoToReferences<CR>` | `vimrc.bundles_ycm:77` |
| `fr` | N | YouCompleteMe 命令 | `:YcmCompleter GoToReferences<CR>` | `vimrc.bundles_ycm:76` |
| `fs` | N | 在当前文件中快速查找光标下的单词 / nmap <leader>s :lv /<c-r>=expand("<cwo... | `:lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>` | `vimrc.config_base:617` |
| `ft` | N | nnoremap <leader><F0> :echo expand('%:p')<CR> / nnoremap ... | `:set filetype=` | `vimrc.config_base:355` |
| `fw` |  | Plug 触发：easymotion-w | `<Plug>(easymotion-w)` | `vimrc.bundles_base:288` |
| `g*` | N sil | 即 `g*zz` | `g*zz` | `vimrc.config_base:420` |
| `g<space>` | N | :Gbrowse | `:GBrowse<CR>` | `filetype_bundles/git.vim:51` |
| `ga` | V | 对齐选区/动作（vim-easy-align） | `<Plug>(EasyAlign)` | `vimrc.bundles_base:793` |
| `ga` | N | 对齐选区/动作（vim-easy-align） | `<Plug>(EasyAlign)` | `vimrc.bundles_base:794` |
| `gb` | N | 使用命令 / GStatue, help fugitive / 使用 Glog 可查看历史版本文件 | `:G blame<CR>` | `filetype_bundles/git.vim:45` |
| `<leader>gh` | N | 让出 gh 给 YCMHover；GitGutter 行高亮迁到 <leader>gh（git highlight） | `:call CustomGitGutterLineHights()<CR>` | `filetype_bundles/git.vim:38` |
| `gh` | N | nmap <leader>d <plug>(YCMHover) / 绑 gh（g-hover）：单键直接触发，不占... | `<plug>(YCMHover)` | `vimrc.bundles_ycm:86` |
| `gl` | N | 跳转快捷键 — --auto-jump=1：仅当结果只有 1 个时自动跳转，不再弹浮窗 / gl: 跳到光标下符号... | `:<C-U>Leaderf gtags --auto-jump=1 -d <C-R><C-W><CR>` | `vimrc.bundles_base:416` |
| `gm` |  | 执行 :GitMessenger | `:GitMessenger<CR>` | `filetype_bundles/git.vim:68` |
| `gn` | N | 跳到下一个变更 hunk | `:GitGutterNextHunk<CR>` | `filetype_bundles/git.vim:25` |
| `go` | N | go: 重新打开【上次的搜索结果】，无需重跑 | `:<C-U>Leaderf gtags --recall<CR>` | `vimrc.bundles_base:422` |
| `gp` | N | 跳到上一个变更 hunk | `:GitGutterPrevHunk<CR>` | `filetype_bundles/git.vim:24` |
| `gr` | N | gr: 找光标下符号的所有【引用】（哪些地方调用了它） | `:<C-U>Leaderf gtags --auto-jump=1 -r <C-R><C-W><CR>` | `vimrc.bundles_base:418` |
| `gs` | N | gs: 找符号的所有【出现位置】（包括字符串字面量、注释中的同名出现） | `:<C-U>Leaderf gtags --auto-jump=1 -s <C-R><C-W><CR>` | `vimrc.bundles_base:420` |
| `<leader>gst` | N | <leader>gst: git status（让出 gs 给 LeaderF gtags -s） | `:G status<CR>` | `filetype_bundles/git.vim:47` |
| `gt` | N | 切换 hunk 标记列 | `:GitGutterToggle<CR>` | `filetype_bundles/git.vim:23` |
| `gz` | N | gz: 撤销当前 hunk（让出 gr 给 LeaderF gtags -r） / 选 gz 因为 g+z 在 v... | `:GitGutterUndoHunk<CR>` | `filetype_bundles/git.vim:28` |
| `<leader>h` |  | — | `<C-W>h` | `vimrc.config_base:390` |
| `H` |  | 行首行尾 | `^` | `vimrc.config_base:393` |
| `<leader>ht` |  | 切换 undo tree | `:GundoToggle<CR>` | `filetype_bundles/git.vim:60` |
| `<leader>i` |  | 执行 :Nine2IndentGuides | `:Nine2IndentGuides<cr>` | `vimrc.bundles_base:169` |
| `<leader>j` |  | ##### 分屏窗口移动 在vim的各个窗口间切换 | `<C-W>j` | `vimrc.config_base:388` |
| `J` |  | 即 `10j` | `10j` | `vimrc.config_base:398` |
| `j` | N | nnoremap gk k | `gj` | `vimrc.config_base:287` |
| `<leader>jf` | N | 调用：B_JsonFormat() | `:call B_JsonFormat()<cr>` | `vimrc.config_base:771` |
| `<leader>k` |  | — | `<C-W>k` | `vimrc.config_base:389` |
| `K` |  | 即 `10k` | `10k` | `vimrc.config_base:399` |
| `k` | N | Treat long lines as break lines (useful when moving aroun... | `gk` | `vimrc.config_base:285` |
| `<leader>l` |  | — | `<C-W>l` | `vimrc.config_base:391` |
| `L` |  | 即 `$` | `$` | `vimrc.config_base:394` |
| `L` | N buf sil | 执行 :call | `:call <SID>status_load(line('.'))<cr>` | `autoload/plug.vim:2655` |
| `L` | V buf sil | 执行 :call | `:call <SID>status_load(line('.'))<cr>` | `autoload/plug.vim:2656` |
| `la` | N | location list 跳指定项 | `:lr<cr>` | `vimrc.config_base:752` |
| `lc` | N | 关闭 location list 窗口 | `:lclose<cr>` | `vimrc.config_base:748` |
| `le` | N | location list 显示全部 | `:lla<cr>` | `vimrc.config_base:753` |
| `<leader>li` | N | 执行 :LeetCodeSignIn | `:LeetCodeSignIn<cr>` | `filetype_bundles/leetcode.vim:20` |
| `lj` | N | 跳转到不同的错误 | `:lnext<cr>` | `vimrc.config_base:750` |
| `lk` | N | 执行 :lprevious | `:lprevious<cr>` | `vimrc.config_base:751` |
| `<leader>ll` | N | 执行 :LeetCodeList | `:LeetCodeList<cr>` | `filetype_bundles/leetcode.vim:17` |
| `lo` | N | Location | `:lopen<cr>` | `vimrc.config_base:747` |
| `<leader>ls` | N | 执行 :LeetCodeSubmit | `:LeetCodeSubmit<cr>` | `filetype_bundles/leetcode.vim:19` |
| `<leader>lt` | N | 执行 :LeetCodeTest | `:LeetCodeTest<cr>` | `filetype_bundles/leetcode.vim:18` |
| `<leader>m` | N | nmap <F9> :TagbarToggle<CR> | `:TagbarToggle<CR>` | `vimrc.bundles_base:626` |
| `ma` | N | 显示所有书签 | `:BookmarkShowAll<CR>` | `vimrc.bundles_base:333` |
| `mc` | N | 清空当前 buffer 书签 | `:BookmarkClear<CR>` | `vimrc.bundles_base:334` |
| `mi` | N | 为书签加注释 | `:BookmarkAnnotate<CR>` | `vimrc.bundles_base:330` |
| `mjj` | N | 执行 :BookmarkMoveDown | `:BookmarkMoveDown` | `vimrc.bundles_base:337` |
| `mkk` | N | 执行 :BookmarkMoveUp | `:BookmarkMoveUp` | `vimrc.bundles_base:336` |
| `mm` | N | 切换书签 | `:BookmarkToggle<CR>` | `vimrc.bundles_base:329` |
| `mn` | N | 下一个书签 | `:BookmarkNext<CR>` | `vimrc.bundles_base:331` |
| `mp` | N | 上一个书签 | `:BookmarkPrev<CR>` | `vimrc.bundles_base:332` |
| `mx` | N | 清空当前 buffer 书签 | `:BookmarkClearAll<CR>` | `vimrc.bundles_base:335` |
| `<Leader>n` | sil | map <leader>n :NERDTreeToggle<CR> | `:NERDTreeFind<cr>` | `vimrc.bundles_base:574` |
| `<Leader>n` |  | — | `<plug>NERDTreeTabsToggle<CR>` | `vimrc.bundles_base:610` |
| `N` | N sil | 即 `Nzz` | `Nzz` | `vimrc.config_base:417` |
| `n` | N sil | ##### 搜索相关 / Keep search pattern at the center of the scr... | `nzz` | `vimrc.config_base:416` |
| `<Leader>nf` | sil | 打开NERDTree,定位到当前文件 | `:NERDTreeFind<cr>` | `vimrc.bundles_base:597` |
| `O` |  | 一次跨10行 / 保留原来的 J 的功能 | `J` | `vimrc.config_base:397` |
| `o` | N buf | — | `<plug>(plug-preview)` | `autoload/plug.vim:2826` |
| `oo` | N | — | `<C-o>` | `vimrc.config_base:761` |
| `<leader>q` | N | Quickly close the current window | `:q<CR>` | `vimrc.config_base:488` |
| `q` | N buf sil | 执行 :call | `:call <SID>close_pane()<cr>` | `autoload/plug.vim:934` |
| `q` | N buf sil | 关闭当前窗口 | `:q<cr>` | `autoload/plug.vim:2752` |
| `qa` | N | 关闭当前窗口 | `:qa<CR>` | `vimrc.config_base:493` |
| `qq` | N | 关闭当前窗口 | `:q<CR>` | `vimrc.config_base:492` |
| `<Leader>r` | N | Plug 触发：quickrun | `<Plug>(quickrun)` | `vimrc.bundles_base:810` |
| `<Leader>r` | N sil | Replace the text with translation | `<Plug>TranslateR` | `filetype_bundles/dependout.vim:24` |
| `<Leader>r` | V sil | 翻译 | `<Plug>TranslateRV` | `filetype_bundles/dependout.vim:25` |
| `R` | N buf sil | 执行 :call | `:call <SID>retry()<cr>` | `autoload/plug.vim:904` |
| `<leader>rw` | N | 调用：ChangeReadOnly() | `:call ChangeReadOnly()<cr>` | `vimrc.config_base:235` |
| `S` | N buf sil | 执行 :PlugStatus | `:PlugStatus<cr>` | `autoload/plug.vim:906` |
| `<Leader>sa` |  | select all 全选 | `ggVG"` | `vimrc.config_base:481` |
| `<Leader>sch` | N | 子窗口中显示 *.cpp 或 *.h | `:A<CR>` | `filetype_bundles/cpp.vim:20` |
| `sf` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | `vimrc.bundles_base:506` |
| `sj` | N | 把单行拆成多行 | `:SplitjoinSplit<cr>` | `vimrc.bundles_base:871` |
| `sk` | N | 把多行合成单行 | `:SplitjoinJoin<cr>` | `vimrc.bundles_base:872` |
| `<leader>so` | N | nmap <leader>so :silent !open % > /dev/null 2>&1<CR> | `:!open %<CR>` | `vimrc.config_base:810` |
| `sp` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF<CR>` | `vimrc.bundles_base:507` |
| `ss` | N sil | 快速保存 快捷键 | `:w<CR>` | `vimrc.config_base:491` |
| `st` |  | 调用：GetCurTmpFileFullPath() | `:call GetCurTmpFileFullPath()<CR>` | `vimrc.config_base:791` |
| `<leader>sv` | N sil | 执行 :so | `:so $MYVIMRC<CR>` | `vimrc.config_base:506` |
| `<Leader>t` | N sil | Echo translation in the cmdline | `<Plug>Translate` | `filetype_bundles/dependout.vim:18` |
| `<Leader>t` | V sil | 翻译 | `<Plug>TranslateV` | `filetype_bundles/dependout.vim:19` |
| `<leader>T` |  | 生成当前项目的 tags | `:call Do_CsTag()<CR>` | `vimrc.config_base:594` |
| `td` |  | map <leader>tn :tabnext<cr> / map <leader>tp :tabprev<cr>... | `:tabclose<cr>` | `vimrc.config_base:448` |
| `th` |  | http://vim.wikia.com/wiki/Alternative_tab_navigation / ht... | `:tabfirst<cr>` | `vimrc.config_base:441` |
| `tj` |  | 执行 :tabprev | `:tabprev<cr>` | `vimrc.config_base:444` |
| `tk` |  | 下一个 tab | `:tabnext<cr>` | `vimrc.config_base:443` |
| `tl` |  | 最后一个 tab | `:tablast<cr>` | `vimrc.config_base:442` |
| `to` |  | map <leader>tm :tabm<cr> | `:tabnew<cr>` | `vimrc.config_base:450` |
| `tU` |  | 驼峰转下划线 | `:%s/\([^ .*+-]\)\([A-Z].\)/\1_\2/g<cr>ggguG` | `vimrc.config_base:786` |
| `tu` |  | set noimdisable / 下划线转驼峰 | `:'<,'> s/_\(\w\)/\u\1/g<cr>:'<,'> s/^\(\w\)/\U\1/g<cr>` | `vimrc.config_base:784` |
| `U` | N | remap U to <C-r> for easier redo | `<C-r>` | `vimrc.config_base:503` |
| `U` | N buf sil | 执行 :call | `:call <SID>status_update()<cr>` | `autoload/plug.vim:907` |
| `U` | V buf sil | 执行 :call | `:call <SID>status_update()<cr>` | `autoload/plug.vim:908` |
| `uh` |  | 执行 :CopyrightUpdate | `:CopyrightUpdate<cr>` | `vimrc.bundles_base:833` |
| `<leader>v` | N | select block | `V`}` | `vimrc.config_base:483` |
| `V` | V | Plug 触发：expand_region_shrink | `<Plug>(expand_region_shrink)` | `vimrc.bundles_base:357` |
| `v` | V | Plug 触发：expand_region_expand | `<Plug>(expand_region_expand)` | `vimrc.bundles_base:356` |
| `<Leader>w` | N sil | Display translation in a window | `<Plug>TranslateW` | `filetype_bundles/dependout.vim:21` |
| `<Leader>w` | V sil | 翻译显示窗口 | `<Plug>TranslateWV` | `filetype_bundles/dependout.vim:22` |
| `w!!` | C | w!! to sudo & write a file | `w !sudo tee >/dev/null %` | `vimrc.config_base:485` |
| `w,` | N | 执行 :vertical | `:vertical resize -3<CR>` | `vimrc.config_base:403` |
| `w-` | N | 执行 :resize | `:resize -3<CR>` | `vimrc.config_base:402` |
| `w.` | N | 执行 :vertical | `:vertical resize +3<CR>` | `vimrc.config_base:404` |
| `w=` | N | 更改窗口大小 | `:resize +3<CR>` | `vimrc.config_base:401` |
| `wa` | N | 当前窗口最大化, 高 | `<C-W>_` | `vimrc.config_base:406` |
| `wd` | N | 恢复窗口大小默认分布 | `<C-W>=` | `vimrc.config_base:410` |
| `ws` | N | 当前窗口最大化, 宽, 注意要有反斜杠 | `<C-W>\\|` | `vimrc.config_base:408` |
| `ww` | N | 高和宽都最大化 | `<C-W>_<C-W>\\|` | `vimrc.config_base:412` |
| `<Leader>x` | N sil | Translate the text in clipboard | `<Plug>TranslateX` | `filetype_bundles/dependout.vim:27` |
| `<leader>x` | N | 保存并退出 | `:x<CR>` | `vimrc.config_base:489` |
| `X` | N buf sil | 执行 :call | `:call <SID>revert()<cr>` | `autoload/plug.vim:2830` |
| `Y` |  | y$ -> Y Make Y behave like other capitals | `y$` | `vimrc.config_base:478` |
| `<leader>z` | N | 调用：Zoom() | `:call Zoom()<CR>` | `vimrc.config_base:633` |
| `zf` |  | 会导致原有 zf  失效 (在 foldmethod=manual 时有效) | `zA` | `vimrc.config_base:149` |
| `<leader>zz` |  | 调用：ToggleFold() | `:call ToggleFold()<cr>` | `vimrc.config_base:146` |
| `zz` | N sil | 调用：SmartZA() | `:call SmartZA()<cr>` | `vimrc.config_base:147` |
| `<C-,>` |  | 即 `<Esc>` | `<Esc>` | `vimrc:17` |
| `<C-]>` | N | nnoremap <leader>] :YcmCompleter GoToDefinitionElseDeclar... | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | `vimrc.bundles_ycm:81` |
| `<c-j>` | S | Plug 触发：complete_parameter#goto_next_parameter | `<Plug>(complete_parameter#goto_next_parameter)` | `vimrc.bundles_base:860` |
| `<c-j>` | I | Plug 触发：complete_parameter#goto_next_parameter | `<Plug>(complete_parameter#goto_next_parameter)` | `vimrc.bundles_base:861` |
| `<c-k>` | S | Plug 触发：complete_parameter#goto_previous_parameter | `<Plug>(complete_parameter#goto_previous_parameter)` | `vimrc.bundles_base:862` |
| `<c-k>` | I | Plug 触发：complete_parameter#goto_previous_parameter | `<Plug>(complete_parameter#goto_previous_parameter)` | `vimrc.bundles_base:863` |
| `<C-n>` | N sil | 调用：NumberToggle() | `:call NumberToggle()<cr>` | `vimrc.config_base:224` |
| `<C-n>` | I | 修改补全触发 | `<C-x><C-o>` | `filetype_bundles/go.vim:93` |
| `<F1>` | N | — | `: call GetCurFileName()<cr>` | `vimrc.config_base:326` |
| `<leader><F1>` | N | — | `: call GetCurFileFullPath()<cr>` | `vimrc.config_base:310` |
| `<F2>` | N | 调用：HideNumber() | `:call HideNumber()<CR>` | `vimrc.config_base:376` |
| `<F3>` |  | 插件 nerdtree 显示关闭快捷键 | `<leader>n` | `vimrc.config_base:378` |
| `<F4>` | N | 执行 :set | `:set wrap! wrap?<CR>` | `vimrc.config_base:379` |
| `<F6>` | N | 执行 :exec | `:exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>` | `vimrc.config_base:383` |
| `<leader><F6>` | N | 即 `:%!xxd -g 2` | `:%!xxd -g 2<CR>` | `vimrc.config_base:384` |
| `<F7>` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | `vimrc.bundles_base:505` |
| `<F8>` |  | 通用格式化（vim-autoformat） | `:Autoformat<CR>` | `vimrc.bundles_complex:24` |
| `<F8>` |  | 执行 :F8FormatFile | `:F8FormatFile<CR>` | `vimrc.bundles_simple:42` |
| `<F10>` |  | 执行 :QuickRun | `:QuickRun<CR>` | `vimrc.bundles_base:811` |
| `<` | V | ##### 选中及操作改键 / 调整缩进后自动选中，方便再次操作 | `<gv` | `vimrc.config_base:475` |
| `<2-LeftMouse>` |  | 双击跳转 | `<C-]>` | `vimrc.config_base:756` |
| `<2-RightMouse>` |  | — | `<C-o>` | `vimrc.config_base:757` |
| `<C-k><C-o>` | I | <C-x><C-x> invokes completions of github-complete.vim / a... | `<Plug>(github-complete-manual-completion)` | `vimrc.bundles_complex:69` |
| `<C-RightMouse>` |  | — | `<C-o>` | `vimrc.config_base:758` |
| `<cr>` | N buf | — | `<plug>(plug-preview)` | `autoload/plug.vim:2823` |
| `<F1><F1>` | N | — | `: call GetCurFileNameAndText()<cr>` | `vimrc.config_base:343` |
| `<Leader><leader>.` |  | map fb <Plug>(easymotion-b) / map fe <Plug>(easymotion-e)... | `<Plug>(easymotion-repeat)` | `vimrc.bundles_base:295` |
| `<leader><leader><F6>` | N | 即 `:%!xxd -r` | `:%!xxd -r<CR>` | `vimrc.config_base:385` |
| `<leader><leader>T` |  | set tags+=~/.vim/systags / set tags+=~/.vim/systags_local... | `:call Do_CsTag_Sys()<CR>` | `vimrc.config_base:573` |
| `<leader><LeftMouse>` |  | — | `<C-i>` | `vimrc.config_base:759` |
| `<plug>(plug-preview)` | N buf sil | 执行 :silent | `:silent! call <SID>preview_commit()<cr>` | `autoload/plug.vim:2821` |
| `<ScrollWheelDown>` |  | — | `<C-E><C-E><C-E>` | `vimrc.config_base:44` |
| `<ScrollWheelUp>` |  | Hide the mouse cursor while typing / set mousehide | `<C-Y><C-Y><C-Y>` | `vimrc.config_base:43` |
| `<silent><expr>` | I | — | `( complete_parameter#pre_complete("()")` | `vimrc.bundles_base:859` |
| `<Tab>` | I | SmartTab 路由：snippet > pum > AI 建议 > 普通 Tab（<C-R>= 绑定，非 <expr>，避免 E565） | `<C-R>=<SID>SmartTab()<CR>` | `vimrc.bundles_complex:112` |
| `<silent><leader>/` |  | 去掉搜索高亮 | `:nohls<CR>` | `vimrc.config_base:426` |
| `<space><F2>` |  | hit space twice to open menu | `:call quickui#menu#open()<cr>` | `filetype_bundles/quickui.vim:60` |

---

## 二、按文件 / 插件分组

### 入口（vimrc）

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `,,` | I | ,, 替换 Esc | `<Esc>` | 16 |
| `<C-,>` |  | 即 `<Esc>` | `<Esc>` | 17 |
| `;` | N | 将 ; 绑定到 : 用于快速进入命令行 | `:` | 19 |

### 基础配置（vimrc.config_base）

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<ScrollWheelUp>` |  | Hide the mouse cursor while typing / set mousehide | `<C-Y><C-Y><C-Y>` | 43 |
| `<ScrollWheelDown>` |  | — | `<C-E><C-E><C-E>` | 44 |
| `<leader>zz` |  | 调用：ToggleFold() | `:call ToggleFold()<cr>` | 146 |
| `zz` | N sil | 调用：SmartZA() | `:call SmartZA()<cr>` | 147 |
| `zf` |  | 会导致原有 zf  失效 (在 foldmethod=manual 时有效) | `zA` | 149 |
| `<C-n>` | N sil | 调用：NumberToggle() | `:call NumberToggle()<cr>` | 224 |
| `<leader>rw` | N | 调用：ChangeReadOnly() | `:call ChangeReadOnly()<cr>` | 235 |
| `k` | N | Treat long lines as break lines (useful when moving aroun... | `gk` | 285 |
| `j` | N | nnoremap gk k | `gj` | 287 |
| `<leader><F1>` | N | — | `: call GetCurFileFullPath()<cr>` | 310 |
| `<F1>` | N | — | `: call GetCurFileName()<cr>` | 326 |
| `<F1><F1>` | N | — | `: call GetCurFileNameAndText()<cr>` | 343 |
| `ft` | N | nnoremap <leader><F0> :echo expand('%:p')<CR> / nnoremap ... | `:set filetype=` | 355 |
| `<F2>` | N | 调用：HideNumber() | `:call HideNumber()<CR>` | 376 |
| `<F3>` |  | 插件 nerdtree 显示关闭快捷键 | `<leader>n` | 378 |
| `<F4>` | N | 执行 :set | `:set wrap! wrap?<CR>` | 379 |
| `<F5>` |  | toggle 'paste' option | `toggle 'paste' option` *(via set pastetoggle)* | 380 |
| `<F6>` | N | 执行 :exec | `:exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>` | 383 |
| `<leader><F6>` | N | 即 `:%!xxd -g 2` | `:%!xxd -g 2<CR>` | 384 |
| `<leader><leader><F6>` | N | 即 `:%!xxd -r` | `:%!xxd -r<CR>` | 385 |
| `<leader>j` |  | ##### 分屏窗口移动 在vim的各个窗口间切换 | `<C-W>j` | 388 |
| `<leader>k` |  | — | `<C-W>k` | 389 |
| `<leader>h` |  | — | `<C-W>h` | 390 |
| `<leader>l` |  | — | `<C-W>l` | 391 |
| `H` |  | 行首行尾 | `^` | 393 |
| `L` |  | 即 `$` | `$` | 394 |
| `O` |  | 一次跨10行 / 保留原来的 J 的功能 | `J` | 397 |
| `J` |  | 即 `10j` | `10j` | 398 |
| `K` |  | 即 `10k` | `10k` | 399 |
| `w=` | N | 更改窗口大小 | `:resize +3<CR>` | 401 |
| `w-` | N | 执行 :resize | `:resize -3<CR>` | 402 |
| `w,` | N | 执行 :vertical | `:vertical resize -3<CR>` | 403 |
| `w.` | N | 执行 :vertical | `:vertical resize +3<CR>` | 404 |
| `wa` | N | 当前窗口最大化, 高 | `<C-W>_` | 406 |
| `ws` | N | 当前窗口最大化, 宽, 注意要有反斜杠 | `<C-W>\\|` | 408 |
| `wd` | N | 恢复窗口大小默认分布 | `<C-W>=` | 410 |
| `ww` | N | 高和宽都最大化 | `<C-W>_<C-W>\\|` | 412 |
| `n` | N sil | ##### 搜索相关 / Keep search pattern at the center of the scr... | `nzz` | 416 |
| `N` | N sil | 即 `Nzz` | `Nzz` | 417 |
| `*` | N sil | 即 `*zz` | `*zz` | 418 |
| `#` | N sil | 即 `#zz` | `#zz` | 419 |
| `g*` | N sil | 即 `g*zz` | `g*zz` | 420 |
| `#` | N | switch # * | `*` | 422 |
| `*` | N | 即 `#` | `#` | 423 |
| `<silent><leader>/` |  | 去掉搜索高亮 | `:nohls<CR>` | 426 |
| `[b` | N | ##### tab/buffer相关 / :b1 :b2   :bf :bl | `:bprevious<cr>` | 430 |
| `]b` | N | 下一个 buffer | `:bnext<cr>` | 431 |
| `bj` | N | 上一个 buffer | `:bprevious<cr>` | 432 |
| `bk` | N | 下一个 buffer | `:bnext<cr>` | 433 |
| `bd` | N | 关闭当前 buffer | `:bdelete<cr>` | 434 |
| `bw` | N | 执行 :bwipeout | `:bwipeout<cr>` | 435 |
| `th` |  | http://vim.wikia.com/wiki/Alternative_tab_navigation / ht... | `:tabfirst<cr>` | 441 |
| `tl` |  | 最后一个 tab | `:tablast<cr>` | 442 |
| `tk` |  | 下一个 tab | `:tabnext<cr>` | 443 |
| `tj` |  | 执行 :tabprev | `:tabprev<cr>` | 444 |
| `td` |  | map <leader>tn :tabnext<cr> / map <leader>tp :tabprev<cr>... | `:tabclose<cr>` | 448 |
| `to` |  | map <leader>tm :tabm<cr> | `:tabnew<cr>` | 450 |
| `<leader>1` |  | normal模式下切换到确切的tab | `1gt` | 453 |
| `<leader>2` |  | 即 `2gt` | `2gt` | 454 |
| `<leader>3` |  | 即 `3gt` | `3gt` | 455 |
| `<leader>4` |  | 即 `4gt` | `4gt` | 456 |
| `<leader>5` |  | 即 `5gt` | `5gt` | 457 |
| `<leader>6` |  | 即 `6gt` | `6gt` | 458 |
| `<leader>7` |  | 即 `7gt` | `7gt` | 459 |
| `<leader>8` |  | 即 `8gt` | `8gt` | 460 |
| `<leader>9` |  | 即 `9gt` | `9gt` | 461 |
| `<leader>0` |  | 最后一个 tab | `:tablast<cr>` | 462 |
| `<leader>=` |  | 执行 :tabedit | `:tabedit<cr>` | 463 |
| `<leader>-` |  | 关闭当前 tab | `:tabclose<cr>` | 464 |
| `<` | V | ##### 选中及操作改键 / 调整缩进后自动选中，方便再次操作 | `<gv` | 475 |
| `>` | V | 即 `>gv` | `>gv` | 476 |
| `Y` |  | y$ -> Y Make Y behave like other capitals | `y$` | 478 |
| `<Leader>sa` |  | select all 全选 | `ggVG"` | 481 |
| `<leader>v` | N | select block | `V`}` | 483 |
| `w!!` | C | w!! to sudo & write a file | `w !sudo tee >/dev/null %` | 485 |
| `<leader>q` | N | Quickly close the current window | `:q<CR>` | 488 |
| `<leader>x` | N | 保存并退出 | `:x<CR>` | 489 |
| `ss` | N sil | 快速保存 快捷键 | `:w<CR>` | 491 |
| `qq` | N | 关闭当前窗口 | `:q<CR>` | 492 |
| `qa` | N | 关闭当前窗口 | `:qa<CR>` | 493 |
| `er` | N | 执行 :e | `:e<CR>` | 494 |
| `'` | N | Swap implementations of ` and ' jump to markers / By defa... | ``` | 499 |
| ``` | N | 即 `'` | `'` | 500 |
| `U` | N | remap U to <C-r> for easier redo | `<C-r>` | 503 |
| `<leader>ev` | N sil | Quickly edit/reload the vimrc file | `:e $MYVIMRC<CR>` | 505 |
| `<leader>sv` | N sil | 执行 :so | `:so $MYVIMRC<CR>` | 506 |
| `,y` | N | 设置快捷键将选中文本块复制至系统剪贴板 | `"+y` | 559 |
| `,y` | V | 即 `"+y` | `"+y` | 560 |
| `,d` | V | 即 `"+d` | `"+d` | 561 |
| `,p` | N | 设置快捷键将系统剪贴板内容粘贴至 vim | `"+p` | 563 |
| `,P` | N | 即 `"+p` | `"+p` | 564 |
| `,p` | V | 即 `"+p` | `"+p` | 565 |
| `,P` | V | 即 `"+P` | `"+P` | 566 |
| `<leader><leader>T` |  | set tags+=~/.vim/systags / set tags+=~/.vim/systags_local... | `:call Do_CsTag_Sys()<CR>` | 573 |
| `<leader>T` |  | 生成当前项目的 tags | `:call Do_CsTag()<CR>` | 594 |
| `fs` | N | 在当前文件中快速查找光标下的单词 / nmap <leader>s :lv /<c-r>=expand("<cwo... | `:lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>` | 617 |
| `<leader>z` | N | 调用：Zoom() | `:call Zoom()<CR>` | 633 |
| `f` |  | 调用：ShowFuncName() | `:call ShowFuncName() <CR>` | 730 |
| `co` | N | Quick | `:copen<cr>` | 739 |
| `cj` | N | quickfix 下一个 | `:cnext<cr>` | 740 |
| `ck` | N | quickfix 上一个 | `:cprevious<cr>` | 741 |
| `cc` | N | 关闭 quickfix 窗口 | `:cclose<cr>` | 742 |
| `ca` | N | quickfix 跳指定项 | `:cr<cr>` | 743 |
| `ce` | N | quickfix 显示全部 | `:cla<cr>` | 744 |
| `lo` | N | Location | `:lopen<cr>` | 747 |
| `lc` | N | 关闭 location list 窗口 | `:lclose<cr>` | 748 |
| `lj` | N | 跳转到不同的错误 | `:lnext<cr>` | 750 |
| `lk` | N | 执行 :lprevious | `:lprevious<cr>` | 751 |
| `la` | N | location list 跳指定项 | `:lr<cr>` | 752 |
| `le` | N | location list 显示全部 | `:lla<cr>` | 753 |
| `<2-LeftMouse>` |  | 双击跳转 | `<C-]>` | 756 |
| `<2-RightMouse>` |  | — | `<C-o>` | 757 |
| `<C-RightMouse>` |  | — | `<C-o>` | 758 |
| `<leader><LeftMouse>` |  | — | `<C-i>` | 759 |
| `oo` | N | — | `<C-o>` | 761 |
| `<leader>jf` | N | 调用：B_JsonFormat() | `:call B_JsonFormat()<cr>` | 771 |
| `tu` |  | set noimdisable / 下划线转驼峰 | `:'<,'> s/_\(\w\)/\u\1/g<cr>:'<,'> s/^\(\w\)/\U\1/g<cr>` | 784 |
| `tU` |  | 驼峰转下划线 | `:%s/\([^ .*+-]\)\([A-Z].\)/\1_\2/g<cr>ggguG` | 786 |
| `st` |  | 调用：GetCurTmpFileFullPath() | `:call GetCurTmpFileFullPath()<CR>` | 791 |
| `<leader>so` | N | nmap <leader>so :silent !open % > /dev/null 2>&1<CR> | `:!open %<CR>` | 810 |

### 主插件配置（vimrc.bundles_base）

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<leader>cd` | N | 执行 :AutoChangeDirectory | `:AutoChangeDirectory <cr>` | 162 |
| `<leader>i` |  | 执行 :Nine2IndentGuides | `:Nine2IndentGuides<cr>` | 169 |
| `<leader>,` |  | 清除尾部空白 | `:FixWhitespace<cr>` | 175 |
| `ek` | N sil | Plug 触发：ale_previous_wrap | `<Plug>(ale_previous_wrap)` | 254 |
| `ej` | N sil | Plug 触发：ale_next_wrap | `<Plug>(ale_next_wrap)` | 255 |
| `eh` | N sil | Plug 触发：ale_first | `<Plug>(ale_first)` | 256 |
| `el` | N sil | Plug 触发：ale_last | `<Plug>(ale_last)` | 257 |
| `fh` |  | let g:EasyMotion_startofline = 0 " keep cursor colum when... | `<Plug>(easymotion-linebackward)` | 287 |
| `fw` |  | Plug 触发：easymotion-w | `<Plug>(easymotion-w)` | 288 |
| `fj` |  | Plug 触发：easymotion-e | `<Plug>(easymotion-e)` | 289 |
| `fk` |  | Plug 触发：easymotion-b | `<Plug>(easymotion-b)` | 290 |
| `fl` |  | Plug 触发：easymotion-lineforward | `<Plug>(easymotion-lineforward)` | 291 |
| `<Leader><leader>.` |  | map fb <Plug>(easymotion-b) / map fe <Plug>(easymotion-e)... | `<Plug>(easymotion-repeat)` | 295 |
| `mm` | N | 切换书签 | `:BookmarkToggle<CR>` | 329 |
| `mi` | N | 为书签加注释 | `:BookmarkAnnotate<CR>` | 330 |
| `mn` | N | 下一个书签 | `:BookmarkNext<CR>` | 331 |
| `mp` | N | 上一个书签 | `:BookmarkPrev<CR>` | 332 |
| `ma` | N | 显示所有书签 | `:BookmarkShowAll<CR>` | 333 |
| `mc` | N | 清空当前 buffer 书签 | `:BookmarkClear<CR>` | 334 |
| `mx` | N | 清空当前 buffer 书签 | `:BookmarkClearAll<CR>` | 335 |
| `mkk` | N | 执行 :BookmarkMoveUp | `:BookmarkMoveUp` | 336 |
| `mjj` | N | 执行 :BookmarkMoveDown | `:BookmarkMoveDown` | 337 |
| `v` | V | Plug 触发：expand_region_expand | `<Plug>(expand_region_expand)` | 356 |
| `V` | V | Plug 触发：expand_region_shrink | `<Plug>(expand_region_shrink)` | 357 |
| `<C-m>` | N | MultiCursor next | `MultiCursor next` *(via g:multi_cursor_next_key)* | 364 |
| `<C-p>` | N | MultiCursor prev | `MultiCursor prev` *(via g:multi_cursor_prev_key)* | 365 |
| `<C-x>` | N | MultiCursor skip | `MultiCursor skip` *(via g:multi_cursor_skip_key)* | 366 |
| `<leader>f` | N | Leaderf <CR> | `Leaderf <CR>` *(via g:Lf_ShortcutF)* | 387 |
| `<leader>b` | N | Leaderf buffer<CR> | `Leaderf buffer<CR>` *(via g:Lf_ShortcutB)* | 388 |
| `gl` | N | 跳转快捷键 — --auto-jump=1：仅当结果只有 1 个时自动跳转，不再弹浮窗 / gl: 跳到光标下符号... | `:<C-U>Leaderf gtags --auto-jump=1 -d <C-R><C-W><CR>` | 416 |
| `gr` | N | gr: 找光标下符号的所有【引用】（哪些地方调用了它） | `:<C-U>Leaderf gtags --auto-jump=1 -r <C-R><C-W><CR>` | 418 |
| `gs` | N | gs: 找符号的所有【出现位置】（包括字符串字面量、注释中的同名出现） | `:<C-U>Leaderf gtags --auto-jump=1 -s <C-R><C-W><CR>` | 420 |
| `go` | N | go: 重新打开【上次的搜索结果】，无需重跑 | `:<C-U>Leaderf gtags --recall<CR>` | 422 |
| `<leader>\` |  | 调用：CtrlsfViewMode() | `:call CtrlsfViewMode()<cr>` | 499 |
| `\` | N | Plug 触发：CtrlSFCwordPath | `<Plug>CtrlSFCwordPath<CR>` | 500 |
| `\\` | N | 使用 normal 方式搜索 | `:let g:ctrlsf_default_view_mode_last = g:ctrlsf_default_view_mode<CR> :let g:...` | 503 |
| `<F7>` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | 505 |
| `sf` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | 506 |
| `sp` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF<CR>` | 507 |
| `<leader>aa` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>'<cr>` | 508 |
| `ag` | N | nmap <F7> :Ag -w <c-r>=expand("<cword>")<cr><cr> / 查找函数调用 | `:Ag -w <c-r>=expand("<cword>")<cr> \\| grep '<c-r>=expand("<cword>")<cr>('<cr>` | 516 |
| `<leader>ag` | N | 查询当前单词, 立刻查询 | `:Ag -w <c-r>=expand("<cword>")<cr><cr>` | 518 |
| `<leader>a` | N | Ag 默认查找当前单词，可修改, 不立刻查询 / nmap <leader>a :Ag <c-r>=expand(... | `:Ag '` | 521 |
| `<Leader>n` | sil | map <leader>n :NERDTreeToggle<CR> | `:NERDTreeFind<cr>` | 574 |
| `<Leader>nf` | sil | 打开NERDTree,定位到当前文件 | `:NERDTreeFind<cr>` | 597 |
| `<C-d>` | sil | 调整窗口大小 / http://129.226.226.195/post/22725.html | `:vertical resize 30<cr>` *au FileType nerdtree* | 601 |
| `<C-l>` | sil | 执行 :vertical | `:vertical resize +10<cr>` *au FileType nerdtree* | 602 |
| `<C-h>` | sil | 执行 :vertical | `:vertical resize -10<cr>` *au FileType nerdtree* | 603 |
| `<Leader>n` |  | — | `<plug>NERDTreeTabsToggle<CR>` | 610 |
| `<leader>m` | N | nmap <F9> :TagbarToggle<CR> | `:TagbarToggle<CR>` | 626 |
| `<leader>lt` | N | LocListToggle (ListToggle) | `LocListToggle (ListToggle)` *(via g:lt_location...)* | 784 |
| `<leader>qt` | N | QFixToggle (ListToggle) | `QFixToggle (ListToggle)` *(via g:lt_quickfix...)* | 785 |
| `cq` | N sil | 适用：在主代码 buffer 中按 :GoReferrers / :GoBuild 后弹出 quickfix， /... | `:cclose<bar>lclose<bar>pclose<CR>` | 790 |
| `ga` | V | 对齐选区/动作（vim-easy-align） | `<Plug>(EasyAlign)` | 793 |
| `ga` | N | 对齐选区/动作（vim-easy-align） | `<Plug>(EasyAlign)` | 794 |
| `<Leader>r` | N | Plug 触发：quickrun | `<Plug>(quickrun)` | 810 |
| `<F10>` |  | 执行 :QuickRun | `:QuickRun<CR>` | 811 |
| `uh` |  | 执行 :CopyrightUpdate | `:CopyrightUpdate<cr>` | 833 |
| `<silent><expr>` | I | — | `( complete_parameter#pre_complete("()")` | 859 |
| `<c-j>` | S | Plug 触发：complete_parameter#goto_next_parameter | `<Plug>(complete_parameter#goto_next_parameter)` | 860 |
| `<c-j>` | I | Plug 触发：complete_parameter#goto_next_parameter | `<Plug>(complete_parameter#goto_next_parameter)` | 861 |
| `<c-k>` | S | Plug 触发：complete_parameter#goto_previous_parameter | `<Plug>(complete_parameter#goto_previous_parameter)` | 862 |
| `<c-k>` | I | Plug 触发：complete_parameter#goto_previous_parameter | `<Plug>(complete_parameter#goto_previous_parameter)` | 863 |
| `sj` | N | 把单行拆成多行 | `:SplitjoinSplit<cr>` | 871 |
| `sk` | N | 把多行合成单行 | `:SplitjoinJoin<cr>` | 872 |
| `p` | N buf | — | `<plug>(qf-preview-open)` *autocmd FileType qf* | 890 |

### 补全相关（vimrc.bundles_complex）

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<F8>` |  | 通用格式化（vim-autoformat） | `:Autoformat<CR>` | 24 |
| `<c-j>` | I | UltiSnips JumpForward | `UltiSnips JumpForward` *(via g:UltiSnipsJumpForwardTrigger)* | 46 |
| `<c-k>` | I | UltiSnips JumpBackward | `UltiSnips JumpBackward` *(via g:UltiSnipsJumpBackwardTrigger)* | 47 |
| `<leader>ds` |  | 在 Dash 中查文档 | `:Dash<cr>` | 60 |
| `<C-k><C-o>` | I | <C-x><C-x> invokes completions of github-complete.vim / a... | `<Plug>(github-complete-manual-completion)` | 69 |
| `<Tab>` | I | SmartTab 路由：snippet > pum > AI 建议 > 普通 Tab（<C-R>= 绑定，非 <expr>，避免 E565） | `<C-R>=<SID>SmartTab()<CR>` | 112 |
| `<Leader>cp` | N | 开关 AI 自动补全（替代已禁用的 Copilot，后端 ModelScope/Qwen3-Coder） | `:AICompleteToggle<CR>` | 124 |
| `<C-l>` | I | 接受 AI 补全建议（不受 pum 开关影响） | `ai_complete#Accept()` | 121 |

### YouCompleteMe（vimrc.bundles_ycm）

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `ff` | N | 定位当前函数、变量的定义处 | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | 73 |
| `fi` | N | YouCompleteMe 命令 | `:YcmCompleter GoToImplementation<CR>` | 74 |
| `<leader>fi` | N | YouCompleteMe 命令 | `:YcmCompleter GoToImplementation<CR>` | 75 |
| `fr` | N | YouCompleteMe 命令 | `:YcmCompleter GoToReferences<CR>` | 76 |
| `<leader>fr` | N | YouCompleteMe 命令 | `:YcmCompleter GoToReferences<CR>` | 77 |
| `<C-]>` | N | nnoremap <leader>] :YcmCompleter GoToDefinitionElseDeclar... | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | 81 |
| `<leader>e` | N | 执行 :YcmDiags | `:YcmDiags<CR>` | 82 |
| `gh` | N | nmap <leader>d <plug>(YCMHover) / 绑 gh（g-hover）：单键直接触发，不占... | `<plug>(YCMHover)` | 86 |

### 备用（vimrc.bundles_simple）

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<F8>` |  | 执行 :F8FormatFile | `:F8FormatFile<CR>` | 42 |

---

## 三、文件类型相关（buffer-local，仅在对应 filetype 生效）

### 文件类型：cpp

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<Leader>ch` | N | 执行 :AS | `:AS<CR>` | 18 |
| `<Leader>sch` | N | 子窗口中显示 *.cpp 或 *.h | `:A<CR>` | 20 |

### 文件类型：dependout

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<Leader>t` | N sil | Echo translation in the cmdline | `<Plug>Translate` | 18 |
| `<Leader>t` | V sil | 翻译 | `<Plug>TranslateV` | 19 |
| `<Leader>w` | N sil | Display translation in a window | `<Plug>TranslateW` | 21 |
| `<Leader>w` | V sil | 翻译显示窗口 | `<Plug>TranslateWV` | 22 |
| `<Leader>r` | N sil | Replace the text with translation | `<Plug>TranslateR` | 24 |
| `<Leader>r` | V sil | 翻译 | `<Plug>TranslateRV` | 25 |
| `<Leader>x` | N sil | Translate the text in clipboard | `<Plug>TranslateX` | 27 |

### 文件类型：git

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `gt` | N | 切换 hunk 标记列 | `:GitGutterToggle<CR>` | 23 |
| `gp` | N | 跳到上一个变更 hunk | `:GitGutterPrevHunk<CR>` | 24 |
| `gn` | N | 跳到下一个变更 hunk | `:GitGutterNextHunk<CR>` | 25 |
| `gz` | N | gz: 撤销当前 hunk（让出 gr 给 LeaderF gtags -r） / 选 gz 因为 g+z 在 v... | `:GitGutterUndoHunk<CR>` | 28 |
| `<leader>gh` | N | 让出 gh 给 YCMHover；GitGutter 行高亮迁到 <leader>gh（git highlight） | `:call CustomGitGutterLineHights()<CR>` | 38 |
| `gb` | N | 使用命令 / GStatue, help fugitive / 使用 Glog 可查看历史版本文件 | `:G blame<CR>` | 45 |
| `<leader>gst` | N | <leader>gst: git status（让出 gs 给 LeaderF gtags -s） | `:G status<CR>` | 47 |
| `g<space>` | N | :Gbrowse | `:GBrowse<CR>` | 51 |
| `<leader>ht` |  | 切换 undo tree | `:GundoToggle<CR>` | 60 |
| `gm` |  | 执行 :GitMessenger | `:GitMessenger<CR>` | 68 |

### 文件类型：go

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<leader>gi` | N | 整理 import | `:GoImports<CR>` | 40 |
| `<C-n>` | I | 修改补全触发 | `<C-x><C-o>` | 93 |
| `<leader>s` | N buf sil | — | `:<C-u>call go#def#Jump("split")<CR>` | 115 |
| `<leader>v` | N buf sil | — | `:<C-u>call go#def#Jump("vsplit")<CR>` | 116 |
| `ff` | N | au FileType go nnoremap <buffer> <silent> <leader>t :<C-u... | `:GoDef<CR>` | 119 |
| `<2-LeftMouse>` | N | 跳到定义（gopls） | `:GoDef<CR>` | 120 |
| `fi` | N | 找接口实现 | `:GoImplements<CR>` | 121 |
| `<F6>` | N | 找接口实现 | `:GoImplements<CR>:cfirst<CR>` | 122 |
| `fr` | N | 找所有引用（gopls） | `:GoReferrers<CR>` | 123 |
| `<F8>` | N | go 文件下, F8 不做 Format 使用, go 有自己的 fmt | `:GoReferrers<CR>` | 125 |
| `fs` | N | 自动导入结构体字段 | `:GoFillStruct<cr>` | 127 |
| `gy` | N | au FileType go nmap <leader><F7> :GoReferrers<cr> / GoInf... | `:GoInfo<cr>` | 130 |
| `<Leader>d` | N | 查看文档 | `:GoDoc<cr>` | 131 |
| `gh` | N | gh：go 文件下的 hover，替代原来落在这个键上的 YCMHover（其它文件类型 gh 仍走 YCM，见 ... | `:GoDoc<cr>` | 133 |
| `wh` | N | SameIds 配色： hi CursorColumn ctermbg=26 | `:GoSameIds<cr>` | 135 |
| `whc` | N | 高亮当前作用域同名标识符 | `:GoSameIdsClear<cr>` | 136 |
| `<leader>rn` |  | 重命名符号 | `:GoRename<cr>` | 137 |
| `ga` | N | 自动导入包, 格式化 imports | `:GoAddTag json` | 140 |
| `gaj` | N | 为 struct 字段添加 tag | `:GoAddTag json<CR>` | 141 |
| `gas` | N | 为 struct 字段添加 tag | `:GoAddTag schema<CR>` | 142 |
| `gad` | N | 为 struct 字段添加 tag | `:GoAddTag db<CR>` | 143 |
| `grt` | N | 移除 struct tag | `:GoRemoveTags db` | 144 |
| `grj` | N | 移除 struct tag | `:GoRemoveTags json<CR>` | 145 |
| `grd` | N | 移除 struct tag | `:GoRemoveTags db<CR>` | 146 |
| `<Leader>e` | N | go build 检查错误 | `:GoBuild<cr>` | 149 |
| `<Leader>gb` | N | Go 编译当前包 | `:GoBuild<cr>` | 150 |
| `cl` | N | 运行 Go metalinter | `:GoMetaLinter<cr>` | 151 |
| `<F10>` | N | 运行 Go metalinter | `:GoMetaLinter<CR>` | 152 |
| `ek` | N sil | quickfix 上一个 | `:cprevious<cr>` | 153 |
| `ej` | N sil | quickfix 下一个 | `:cnext<cr>` | 154 |
| `eh` | N sil | quickfix 跳指定项 | `:cr<cr>` | 155 |
| `el` | N sil | quickfix 显示全部 | `:cla<cr>` | 156 |
| `<Leader>tt` | N | 运行测试函数 | `:call Nine2GoTest()<cr>` | 158 |
| `<Leader>tb` | N | 调用：Nine2GoBench() | `:call Nine2GoBench()<cr>` | 159 |
| `<Leader>tf` | N | 调用：Nine2GoTestFunc() | `:call Nine2GoTestFunc()<cr>` | 160 |
| `<F9>` | N | 调用：Nine2GoTestFunc() | `:call Nine2GoTestFunc()<CR>` | 161 |
| `<leader><F9>` | N | 调用：Nine2GoBenchmarkFunc() | `:call Nine2GoBenchmarkFunc()<CR>` | 162 |
| `<leader>bb` |  | let g:delve_backend = "native" | `:DlvAddBreakpoint<cr>` | 247 |
| `<leader>ba` |  | delve toggle tracepoint | `:DlvToggleTracepoint<cr>` | 248 |
| `<leader>br` |  | delve 删除断点 | `:DlvRemoveBreakpoint<cr>` | 249 |
| `<leader>bc` |  | au FileType go map <leader>be :DlvRemoveTracepoint<cr> | `:DlvClearAll<cr>` | 251 |
| `<leader>bd` |  | au FileType go map <leader>bt :DlvTest<cr> | `:DlvDebug<cr>` | 253 |
| `<leader>gt` |  | 运行 Go 测试 | `:GoTests<cr>` | 261 |

### 文件类型：leetcode

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<leader>ll` | N | 执行 :LeetCodeList | `:LeetCodeList<cr>` | 17 |
| `<leader>lt` | N | 执行 :LeetCodeTest | `:LeetCodeTest<cr>` | 18 |
| `<leader>ls` | N | 执行 :LeetCodeSubmit | `:LeetCodeSubmit<cr>` | 19 |
| `<leader>li` | N | 执行 :LeetCodeSignIn | `:LeetCodeSignIn<cr>` | 20 |

### 文件类型：quickui

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<space><F2>` |  | hit space twice to open menu | `:call quickui#menu#open()<cr>` | 60 |

### 文件类型：uml

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<F10>` | N | 执行 :w | `:w<CR> :PlantumlOpenSVG<CR>` | 28 |
| `<F10>` | I | — | `<Esc>:w<CR> :PlantumlOpenSVG<CR>` | 29 |

---

## 维护

本表由 `tools/gen_shortcuts_md.py` 自动扫描 `config/` 下所有配置生成。
**新增 / 修改 / 删除快捷键后，请重新生成本表**：

```bash
python3 ~/mydotfiles/b-dotfiles/b-vim/tools/gen_shortcuts_md.py
# 或在仓库目录内：
# cd ~/mydotfiles/b-dotfiles/b-vim && python3 tools/gen_shortcuts_md.py
```

脚本依赖：仅 Python 3 标准库，无外部依赖。

**最后更新**: 2026-05-08