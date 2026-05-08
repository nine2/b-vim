# Vim 快捷键速查表

**生成日期**: 2026-05-08
**总数**: 275 个映射（含 nmap/imap/vmap/smap/map + 变量配置式）
**全局映射**: 217（不含 buffer-local 的 FileType 限定项）

> **mode 列说明**：N=normal, I=insert, V=visual, S=select, C=cmdline；buf=buffer-local
> **leader 设置**：`<leader>` = `<Space>`（vimrc:13）

---

## 一、全局快捷键（按字母排序）

> 排序键：`<leader>X` 取 X，`gd` 取 g，`<F8>` 排到最后。说明列优先取上方注释，否则查命令字典。

| 按键 | 模式 | 说明 | 命令 | 来源 |
|------|:----:|------|------|------|
| `#` | N sil | 即 `#zz` | `#zz` | `vimrc.config_base:402` |
| `#` | N | switch # * | `*` | `vimrc.config_base:405` |
| `'` | N | Swap implementations of ` and ' jump to markers / By defa... | ``` | `vimrc.config_base:482` |
| `*` | N sil | 即 `*zz` | `*zz` | `vimrc.config_base:401` |
| `*` | N | 即 `#` | `#` | `vimrc.config_base:406` |
| `<leader>,` |  | 清除尾部空白 | `:FixWhitespace<cr>` | `vimrc.bundles_base:172` |
| `,,` | I | ,, 替换 Esc | `<Esc>` | `vimrc:16` |
| `,d` | V | 即 `"+d` | `"+d` | `vimrc.config_base:544` |
| `,P` | N | 即 `"+p` | `"+p` | `vimrc.config_base:547` |
| `,P` | V | 即 `"+P` | `"+P` | `vimrc.config_base:549` |
| `,p` | N | 设置快捷键将系统剪贴板内容粘贴至 vim | `"+p` | `vimrc.config_base:546` |
| `,p` | V | 即 `"+p` | `"+p` | `vimrc.config_base:548` |
| `,y` | N | 设置快捷键将选中文本块复制至系统剪贴板 | `"+y` | `vimrc.config_base:542` |
| `,y` | V | 即 `"+y` | `"+y` | `vimrc.config_base:543` |
| `<leader>-` |  | 关闭当前 tab | `:tabclose<cr>` | `vimrc.config_base:447` |
| `<leader>0` |  | 最后一个 tab | `:tablast<cr>` | `vimrc.config_base:445` |
| `<leader>1` |  | normal模式下切换到确切的tab | `1gt` | `vimrc.config_base:436` |
| `<leader>2` |  | 即 `2gt` | `2gt` | `vimrc.config_base:437` |
| `<leader>3` |  | 即 `3gt` | `3gt` | `vimrc.config_base:438` |
| `<leader>4` |  | 即 `4gt` | `4gt` | `vimrc.config_base:439` |
| `<leader>5` |  | 即 `5gt` | `5gt` | `vimrc.config_base:440` |
| `<leader>6` |  | 即 `6gt` | `6gt` | `vimrc.config_base:441` |
| `<leader>7` |  | 即 `7gt` | `7gt` | `vimrc.config_base:442` |
| `<leader>8` |  | 即 `8gt` | `8gt` | `vimrc.config_base:443` |
| `<leader>9` |  | 即 `9gt` | `9gt` | `vimrc.config_base:444` |
| `;` | N | 将 ; 绑定到 : 用于快速进入命令行 | `:` | `vimrc:19` |
| `<leader>=` |  | 执行 :tabedit | `:tabedit<cr>` | `vimrc.config_base:446` |
| `>` | V | 即 `>gv` | `>gv` | `vimrc.config_base:459` |
| `[b` | N | ##### tab/buffer相关 / :b1 :b2   :bf :bl | `:bprevious<cr>` | `vimrc.config_base:413` |
| `<leader>\` |  | 调用：CtrlsfViewMode() | `:call CtrlsfViewMode()<cr>` | `vimrc.bundles_base:494` |
| `\` | N | Plug 触发：CtrlSFCwordPath | `<Plug>CtrlSFCwordPath<CR>` | `vimrc.bundles_base:495` |
| `\\` | N | 使用 normal 方式搜索 | `:let g:ctrlsf_default_view_mode_last = g:ctrlsf_default_view_mode<CR> :let g:...` | `vimrc.bundles_base:498` |
| `]b` | N | 下一个 buffer | `:bnext<cr>` | `vimrc.config_base:414` |
| ``` | N | 即 `'` | `'` | `vimrc.config_base:483` |
| `<leader>a` | N | Ag 默认查找当前单词，可修改, 不立刻查询 / nmap <leader>a :Ag <c-r>=expand(... | `:Ag '` | `vimrc.bundles_base:516` |
| `<leader>aa` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>'<cr>` | `vimrc.bundles_base:503` |
| `<leader>ag` | N | 查询当前单词, 立刻查询 | `:Ag -w <c-r>=expand("<cword>")<cr><cr>` | `vimrc.bundles_base:513` |
| `ag` | N | nmap <F7> :Ag -w <c-r>=expand("<cword>")<cr><cr> / 查找函数调用 | `:Ag -w <c-r>=expand("<cword>")<cr> \\| grep '<c-r>=expand("<cword>")<cr>('<cr>` | `vimrc.bundles_base:511` |
| `bd` | N | 关闭当前 buffer | `:bdelete<cr>` | `vimrc.config_base:417` |
| `bj` | N | 上一个 buffer | `:bprevious<cr>` | `vimrc.config_base:415` |
| `bk` | N | 下一个 buffer | `:bnext<cr>` | `vimrc.config_base:416` |
| `bw` | N | 执行 :bwipeout | `:bwipeout<cr>` | `vimrc.config_base:418` |
| `ca` | N | quickfix 跳指定项 | `:cr<cr>` | `vimrc.config_base:726` |
| `cc` | N | 关闭 quickfix 窗口 | `:cclose<cr>` | `vimrc.config_base:725` |
| `<leader>cd` | N | 执行 :AutoChangeDirectory | `:AutoChangeDirectory <cr>` | `vimrc.bundles_base:159` |
| `ce` | N | quickfix 显示全部 | `:cla<cr>` | `vimrc.config_base:727` |
| `<Leader>ch` | N | 执行 :AS | `:AS<CR>` | `filetype_bundles/cpp.vim:18` |
| `cj` | N | quickfix 下一个 | `:cnext<cr>` | `vimrc.config_base:723` |
| `ck` | N | quickfix 上一个 | `:cprevious<cr>` | `vimrc.config_base:724` |
| `co` | N | Quick | `:copen<cr>` | `vimrc.config_base:722` |
| `<Leader>cp` | N | 显示建议面板 | `:Copilot panel<CR>` | `vimrc.bundles_complex:109` |
| `<leader>cq` | N sil | 一键关闭所有辅助窗口（quickfix + location list + preview） / 适用场景：在主代... | `:cclose<bar>lclose<bar>pclose<CR>` | `vimrc.bundles_base:784` |
| `<leader>ds` |  | 在 Dash 中查文档 | `:Dash<cr>` | `vimrc.bundles_complex:60` |
| `<leader>e` | N | 执行 :YcmDiags | `:YcmDiags<CR>` | `vimrc.bundles_ycm:77` |
| `eh` | N sil | Plug 触发：ale_first | `<Plug>(ale_first)` | `vimrc.bundles_base:253` |
| `ej` | N sil | Plug 触发：ale_next_wrap | `<Plug>(ale_next_wrap)` | `vimrc.bundles_base:252` |
| `ek` | N sil | Plug 触发：ale_previous_wrap | `<Plug>(ale_previous_wrap)` | `vimrc.bundles_base:251` |
| `el` | N sil | Plug 触发：ale_last | `<Plug>(ale_last)` | `vimrc.bundles_base:254` |
| `er` | N | 执行 :e | `:e<CR>` | `vimrc.config_base:477` |
| `<leader>ev` | N sil | Quickly edit/reload the vimrc file | `:e $MYVIMRC<CR>` | `vimrc.config_base:488` |
| `f` |  | 调用：ShowFuncName() | `:call ShowFuncName() <CR>` | `vimrc.config_base:713` |
| `ff` | N | 定位当前函数、变量的定义处 | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | `vimrc.bundles_ycm:68` |
| `fh` |  | let g:EasyMotion_startofline = 0 " keep cursor colum when... | `<Plug>(easymotion-linebackward)` | `vimrc.bundles_base:284` |
| `<leader>fi` | N | YouCompleteMe 命令 | `:YcmCompleter GoToImplementation<CR>` | `vimrc.bundles_ycm:70` |
| `fi` | N | YouCompleteMe 命令 | `:YcmCompleter GoToImplementation<CR>` | `vimrc.bundles_ycm:69` |
| `fj` |  | Plug 触发：easymotion-e | `<Plug>(easymotion-e)` | `vimrc.bundles_base:286` |
| `fk` |  | Plug 触发：easymotion-b | `<Plug>(easymotion-b)` | `vimrc.bundles_base:287` |
| `fl` |  | Plug 触发：easymotion-lineforward | `<Plug>(easymotion-lineforward)` | `vimrc.bundles_base:288` |
| `<leader>fr` | N | YouCompleteMe 命令 | `:YcmCompleter GoToReferences<CR>` | `vimrc.bundles_ycm:72` |
| `fr` | N | YouCompleteMe 命令 | `:YcmCompleter GoToReferences<CR>` | `vimrc.bundles_ycm:71` |
| `fs` | N | 在当前文件中快速查找光标下的单词 / nmap <leader>s :lv /<c-r>=expand("<cwo... | `:lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>` | `vimrc.config_base:600` |
| `ft` | N | nnoremap <leader><F0> :echo expand('%:p')<CR> / nnoremap ... | `:set filetype=` | `vimrc.config_base:338` |
| `fw` |  | Plug 触发：easymotion-w | `<Plug>(easymotion-w)` | `vimrc.bundles_base:285` |
| `g*` | N sil | 即 `g*zz` | `g*zz` | `vimrc.config_base:403` |
| `g<space>` | N | :Gbrowse | `:GBrowse<CR>` | `filetype_bundles/git.vim:50` |
| `ga` | V | 对齐选区/动作（vim-easy-align） | `<Plug>(EasyAlign)` | `vimrc.bundles_base:787` |
| `ga` | N | 对齐选区/动作（vim-easy-align） | `<Plug>(EasyAlign)` | `vimrc.bundles_base:788` |
| `gb` | N | 使用命令 / GStatue, help fugitive / 使用 Glog 可查看历史版本文件 | `:G blame<CR>` | `filetype_bundles/git.vim:44` |
| `gd` | N | 跳转快捷键 — --auto-jump=1：仅当结果只有 1 个时自动跳转，不再弹浮窗 / gd: 跳到光标下符号... | `:<C-U>Leaderf gtags --auto-jump=1 -d <C-R><C-W><CR>` | `vimrc.bundles_base:411` |
| `gh` | N | 调用：CustomGitGutterLineHights() | `:call CustomGitGutterLineHights()<CR>` | `filetype_bundles/git.vim:37` |
| `gm` |  | 执行 :GitMessenger | `:GitMessenger<CR>` | `filetype_bundles/git.vim:67` |
| `gn` | N | 跳到下一个变更 hunk | `:GitGutterNextHunk<CR>` | `filetype_bundles/git.vim:25` |
| `go` | N | go: 重新打开【上次的搜索结果】，无需重跑 | `:<C-U>Leaderf gtags --recall<CR>` | `vimrc.bundles_base:417` |
| `gp` | N | 跳到上一个变更 hunk | `:GitGutterPrevHunk<CR>` | `filetype_bundles/git.vim:24` |
| `gr` | N | gr: 找光标下符号的所有【引用】（哪些地方调用了它） | `:<C-U>Leaderf gtags --auto-jump=1 -r <C-R><C-W><CR>` | `vimrc.bundles_base:413` |
| `gs` | N | gs: 找符号的所有【出现位置】（包括字符串字面量、注释中的同名出现） | `:<C-U>Leaderf gtags --auto-jump=1 -s <C-R><C-W><CR>` | `vimrc.bundles_base:415` |
| `<leader>gst` | N | <leader>gst: git status（让出 gs 给 LeaderF gtags -s） | `:G status<CR>` | `filetype_bundles/git.vim:46` |
| `gt` | N | 切换 hunk 标记列 | `:GitGutterToggle<CR>` | `filetype_bundles/git.vim:23` |
| `gz` | N | gz: 撤销当前 hunk（让出 gr 给 LeaderF gtags -r） / 选 gz 因为 g+z 在 v... | `:GitGutterUndoHunk<CR>` | `filetype_bundles/git.vim:28` |
| `<leader>h` |  | — | `<C-W>h` | `vimrc.config_base:373` |
| `H` |  | 行首行尾 | `^` | `vimrc.config_base:376` |
| `<leader>ht` |  | 切换 undo tree | `:GundoToggle<CR>` | `filetype_bundles/git.vim:59` |
| `hw` | N | 高亮当前单词，同时光标停留在当前单词不跳转，可能需要先使用 gd 高亮一次才会生效 | `:let @/=expand('<cword>')<cr>` | `vimrc.config_base:764` |
| `<leader>i` |  | 执行 :Nine2IndentGuides | `:Nine2IndentGuides<cr>` | `vimrc.bundles_base:166` |
| `<leader>j` |  | ##### 分屏窗口移动 在vim的各个窗口间切换 | `<C-W>j` | `vimrc.config_base:371` |
| `J` |  | 即 `10j` | `10j` | `vimrc.config_base:381` |
| `j` | N | nnoremap gk k | `gj` | `vimrc.config_base:270` |
| `<leader>jf` | N | 调用：B_JsonFormat() | `:call B_JsonFormat()<cr>` | `vimrc.config_base:754` |
| `<leader>k` |  | — | `<C-W>k` | `vimrc.config_base:372` |
| `K` |  | 即 `10k` | `10k` | `vimrc.config_base:382` |
| `k` | N | Treat long lines as break lines (useful when moving aroun... | `gk` | `vimrc.config_base:268` |
| `<leader>l` |  | — | `<C-W>l` | `vimrc.config_base:374` |
| `L` |  | 即 `$` | `$` | `vimrc.config_base:377` |
| `la` | N | location list 跳指定项 | `:lr<cr>` | `vimrc.config_base:735` |
| `lc` | N | 关闭 location list 窗口 | `:lclose<cr>` | `vimrc.config_base:731` |
| `le` | N | location list 显示全部 | `:lla<cr>` | `vimrc.config_base:736` |
| `<leader>li` | N | 执行 :LeetCodeSignIn | `:LeetCodeSignIn<cr>` | `filetype_bundles/leetcode.vim:20` |
| `lj` | N | 跳转到不同的错误 | `:lnext<cr>` | `vimrc.config_base:733` |
| `lk` | N | 执行 :lprevious | `:lprevious<cr>` | `vimrc.config_base:734` |
| `<leader>ll` | N | 执行 :LeetCodeList | `:LeetCodeList<cr>` | `filetype_bundles/leetcode.vim:17` |
| `lo` | N | Location | `:lopen<cr>` | `vimrc.config_base:730` |
| `<leader>ls` | N | 执行 :LeetCodeSubmit | `:LeetCodeSubmit<cr>` | `filetype_bundles/leetcode.vim:19` |
| `<leader>lt` | N | 执行 :LeetCodeTest | `:LeetCodeTest<cr>` | `filetype_bundles/leetcode.vim:18` |
| `<leader>m` | N | nmap <F9> :TagbarToggle<CR> | `:TagbarToggle<CR>` | `vimrc.bundles_base:621` |
| `ma` | N | 显示所有书签 | `:BookmarkShowAll<CR>` | `vimrc.bundles_base:330` |
| `mc` | N | 清空当前 buffer 书签 | `:BookmarkClear<CR>` | `vimrc.bundles_base:331` |
| `mi` | N | 为书签加注释 | `:BookmarkAnnotate<CR>` | `vimrc.bundles_base:327` |
| `mjj` | N | 执行 :BookmarkMoveDown | `:BookmarkMoveDown` | `vimrc.bundles_base:334` |
| `mkk` | N | 执行 :BookmarkMoveUp | `:BookmarkMoveUp` | `vimrc.bundles_base:333` |
| `mm` | N | 切换书签 | `:BookmarkToggle<CR>` | `vimrc.bundles_base:326` |
| `mn` | N | 下一个书签 | `:BookmarkNext<CR>` | `vimrc.bundles_base:328` |
| `mp` | N | 上一个书签 | `:BookmarkPrev<CR>` | `vimrc.bundles_base:329` |
| `mx` | N | 清空当前 buffer 书签 | `:BookmarkClearAll<CR>` | `vimrc.bundles_base:332` |
| `<Leader>n` | sil | map <leader>n :NERDTreeToggle<CR> | `:NERDTreeFind<cr>` | `vimrc.bundles_base:569` |
| `<Leader>n` |  | — | `<plug>NERDTreeTabsToggle<CR>` | `vimrc.bundles_base:605` |
| `N` | N sil | 即 `Nzz` | `Nzz` | `vimrc.config_base:400` |
| `n` | N sil | ##### 搜索相关 / Keep search pattern at the center of the scr... | `nzz` | `vimrc.config_base:399` |
| `<Leader>nf` | sil | 打开NERDTree,定位到当前文件 | `:NERDTreeFind<cr>` | `vimrc.bundles_base:592` |
| `O` |  | 一次跨10行 / 保留原来的 J 的功能 | `J` | `vimrc.config_base:380` |
| `oo` | N | — | `<C-o>` | `vimrc.config_base:744` |
| `<leader>q` | N | Quickly close the current window | `:q<CR>` | `vimrc.config_base:471` |
| `qa` | N | 关闭当前窗口 | `:qa<CR>` | `vimrc.config_base:476` |
| `qq` | N | 关闭当前窗口 | `:q<CR>` | `vimrc.config_base:475` |
| `<Leader>r` | N | Plug 触发：quickrun | `<Plug>(quickrun)` | `vimrc.bundles_base:804` |
| `<Leader>r` | N sil | Replace the text with translation | `<Plug>TranslateR` | `filetype_bundles/dependout.vim:24` |
| `<Leader>r` | V sil | 翻译 | `<Plug>TranslateRV` | `filetype_bundles/dependout.vim:25` |
| `<leader>rw` | N | 调用：ChangeReadOnly() | `:call ChangeReadOnly()<cr>` | `vimrc.config_base:218` |
| `<Leader>sa` |  | select all 全选 | `ggVG"` | `vimrc.config_base:464` |
| `<Leader>sch` | N | 子窗口中显示 *.cpp 或 *.h | `:A<CR>` | `filetype_bundles/cpp.vim:20` |
| `sf` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | `vimrc.bundles_base:501` |
| `sj` | N | 把单行拆成多行 | `:SplitjoinSplit<cr>` | `vimrc.bundles_base:865` |
| `sk` | N | 把多行合成单行 | `:SplitjoinJoin<cr>` | `vimrc.bundles_base:866` |
| `<leader>so` | N | nmap <leader>so :silent !open % > /dev/null 2>&1<CR> | `:!open %<CR>` | `vimrc.config_base:790` |
| `sp` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF<CR>` | `vimrc.bundles_base:502` |
| `ss` | N sil | 快速保存 快捷键 | `:w<CR>` | `vimrc.config_base:474` |
| `st` |  | 调用：GetCurTmpFileFullPath() | `:call GetCurTmpFileFullPath()<CR>` | `vimrc.config_base:775` |
| `<leader>sv` | N sil | 执行 :so | `:so $MYVIMRC<CR>` | `vimrc.config_base:489` |
| `<Leader>t` | N sil | Echo translation in the cmdline | `<Plug>Translate` | `filetype_bundles/dependout.vim:18` |
| `<Leader>t` | V sil | 翻译 | `<Plug>TranslateV` | `filetype_bundles/dependout.vim:19` |
| `<leader>T` |  | 生成当前项目的 tags | `:call Do_CsTag()<CR>` | `vimrc.config_base:577` |
| `td` |  | map <leader>tn :tabnext<cr> / map <leader>tp :tabprev<cr>... | `:tabclose<cr>` | `vimrc.config_base:431` |
| `th` |  | http://vim.wikia.com/wiki/Alternative_tab_navigation / ht... | `:tabfirst<cr>` | `vimrc.config_base:424` |
| `tj` |  | 执行 :tabprev | `:tabprev<cr>` | `vimrc.config_base:427` |
| `tk` |  | 下一个 tab | `:tabnext<cr>` | `vimrc.config_base:426` |
| `tl` |  | 最后一个 tab | `:tablast<cr>` | `vimrc.config_base:425` |
| `to` |  | map <leader>tm :tabm<cr> | `:tabnew<cr>` | `vimrc.config_base:433` |
| `tU` |  | 驼峰转下划线 | `:%s/\([^ .*+-]\)\([A-Z].\)/\1_\2/g<cr>ggguG` | `vimrc.config_base:770` |
| `tu` |  | set noimdisable / 下划线转驼峰 | `:'<,'> s/_\(\w\)/\u\1/g<cr>:'<,'> s/^\(\w\)/\U\1/g<cr>` | `vimrc.config_base:768` |
| `U` | N | remap U to <C-r> for easier redo | `<C-r>` | `vimrc.config_base:486` |
| `uh` |  | 执行 :CopyrightUpdate | `:CopyrightUpdate<cr>` | `vimrc.bundles_base:827` |
| `<leader>v` | N | select block | `V`}` | `vimrc.config_base:466` |
| `V` | V | Plug 触发：expand_region_shrink | `<Plug>(expand_region_shrink)` | `vimrc.bundles_base:354` |
| `v` | V | Plug 触发：expand_region_expand | `<Plug>(expand_region_expand)` | `vimrc.bundles_base:353` |
| `<Leader>w` | N sil | Display translation in a window | `<Plug>TranslateW` | `filetype_bundles/dependout.vim:21` |
| `<Leader>w` | V sil | 翻译显示窗口 | `<Plug>TranslateWV` | `filetype_bundles/dependout.vim:22` |
| `w!!` | C | w!! to sudo & write a file | `w !sudo tee >/dev/null %` | `vimrc.config_base:468` |
| `w,` | N | 执行 :vertical | `:vertical resize -3<CR>` | `vimrc.config_base:386` |
| `w-` | N | 执行 :resize | `:resize -3<CR>` | `vimrc.config_base:385` |
| `w.` | N | 执行 :vertical | `:vertical resize +3<CR>` | `vimrc.config_base:387` |
| `w=` | N | 更改窗口大小 | `:resize +3<CR>` | `vimrc.config_base:384` |
| `wa` | N | 当前窗口最大化, 高 | `<C-W>_` | `vimrc.config_base:389` |
| `wd` | N | 恢复窗口大小默认分布 | `<C-W>=` | `vimrc.config_base:393` |
| `ws` | N | 当前窗口最大化, 宽, 注意要有反斜杠 | `<C-W>\\|` | `vimrc.config_base:391` |
| `ww` | N | 高和宽都最大化 | `<C-W>_<C-W>\\|` | `vimrc.config_base:395` |
| `<Leader>x` | N sil | Translate the text in clipboard | `<Plug>TranslateX` | `filetype_bundles/dependout.vim:27` |
| `<leader>x` | N | 保存并退出 | `:x<CR>` | `vimrc.config_base:472` |
| `Y` |  | y$ -> Y Make Y behave like other capitals | `y$` | `vimrc.config_base:461` |
| `<leader>z` | N | 调用：Zoom() | `:call Zoom()<CR>` | `vimrc.config_base:616` |
| `zf` |  | 会导致原有 zf  失效 (在 foldmethod=manual 时有效) | `zA` | `vimrc.config_base:149` |
| `<leader>zz` |  | 调用：ToggleFold() | `:call ToggleFold()<cr>` | `vimrc.config_base:146` |
| `zz` |  | 即 `za` | `za` | `vimrc.config_base:147` |
| `<C-,>` |  | 即 `<Esc>` | `<Esc>` | `vimrc:17` |
| `<C-]>` | N | nnoremap <leader>] :YcmCompleter GoToDefinitionElseDeclar... | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | `vimrc.bundles_ycm:76` |
| `<c-j>` | S | Plug 触发：complete_parameter#goto_next_parameter | `<Plug>(complete_parameter#goto_next_parameter)` | `vimrc.bundles_base:854` |
| `<c-j>` | I | Plug 触发：complete_parameter#goto_next_parameter | `<Plug>(complete_parameter#goto_next_parameter)` | `vimrc.bundles_base:855` |
| `<c-k>` | S | Plug 触发：complete_parameter#goto_previous_parameter | `<Plug>(complete_parameter#goto_previous_parameter)` | `vimrc.bundles_base:856` |
| `<c-k>` | I | Plug 触发：complete_parameter#goto_previous_parameter | `<Plug>(complete_parameter#goto_previous_parameter)` | `vimrc.bundles_base:857` |
| `<C-n>` | N sil | 调用：NumberToggle() | `:call NumberToggle()<cr>` | `vimrc.config_base:207` |
| `<C-n>` | I | 修改补全触发 | `<C-x><C-o>` | `filetype_bundles/go.vim:80` |
| `<F1>` | N | — | `: call GetCurFileName()<cr>` | `vimrc.config_base:309` |
| `<leader><F1>` | N | — | `: call GetCurFileFullPath()<cr>` | `vimrc.config_base:293` |
| `<F2>` | N | 调用：HideNumber() | `:call HideNumber()<CR>` | `vimrc.config_base:359` |
| `<F3>` |  | 插件 nerdtree 显示关闭快捷键 | `<leader>n` | `vimrc.config_base:361` |
| `<F4>` | N | 执行 :set | `:set wrap! wrap?<CR>` | `vimrc.config_base:362` |
| `<F6>` | N | 执行 :exec | `:exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>` | `vimrc.config_base:366` |
| `<leader><F6>` | N | 即 `:%!xxd -g 2` | `:%!xxd -g 2<CR>` | `vimrc.config_base:367` |
| `<F7>` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | `vimrc.bundles_base:500` |
| `<F8>` |  | 通用格式化（vim-autoformat） | `:Autoformat<CR>` | `vimrc.bundles_complex:24` |
| `<F8>` |  | 执行 :F8FormatFile | `:F8FormatFile<CR>` | `vimrc.bundles_simple:42` |
| `<F10>` |  | 执行 :QuickRun | `:QuickRun<CR>` | `vimrc.bundles_base:805` |
| `<` | V | ##### 选中及操作改键 / 调整缩进后自动选中，方便再次操作 | `<gv` | `vimrc.config_base:458` |
| `<2-LeftMouse>` |  | 双击跳转 | `<C-]>` | `vimrc.config_base:739` |
| `<2-RightMouse>` |  | — | `<C-o>` | `vimrc.config_base:740` |
| `<C-k><C-o>` | I | <C-x><C-x> invokes completions of github-complete.vim / a... | `<Plug>(github-complete-manual-completion)` | `vimrc.bundles_complex:69` |
| `<C-RightMouse>` |  | — | `<C-o>` | `vimrc.config_base:741` |
| `<F1><F1>` | N | — | `: call GetCurFileNameAndText()<cr>` | `vimrc.config_base:326` |
| `<Leader><leader>.` |  | map fb <Plug>(easymotion-b) / map fe <Plug>(easymotion-e)... | `<Plug>(easymotion-repeat)` | `vimrc.bundles_base:292` |
| `<leader><leader><F6>` | N | 即 `:%!xxd -r` | `:%!xxd -r<CR>` | `vimrc.config_base:368` |
| `<leader><leader>T` |  | set tags+=~/.vim/systags / set tags+=~/.vim/systags_local... | `:call Do_CsTag_Sys()<CR>` | `vimrc.config_base:556` |
| `<leader><LeftMouse>` |  | — | `<C-i>` | `vimrc.config_base:742` |
| `<ScrollWheelDown>` |  | — | `<C-E><C-E><C-E>` | `vimrc.config_base:44` |
| `<ScrollWheelUp>` |  | Hide the mouse cursor while typing / set mousehide | `<C-Y><C-Y><C-Y>` | `vimrc.config_base:43` |
| `<silent><expr>` | I | — | `( complete_parameter#pre_complete("()")` | `vimrc.bundles_base:853` |
| `<silent><expr>` | I | — | `<Tab> <SID>SmartTab()` | `vimrc.bundles_complex:94` |
| `<silent><leader>/` |  | 去掉搜索高亮 | `:nohls<CR>` | `vimrc.config_base:409` |
| `<Space>` | N | nmap <leader>d <plug>(YCMHover) | `<plug>(YCMHover)` | `vimrc.bundles_ycm:80` |
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
| `zz` |  | 即 `za` | `za` | 147 |
| `zf` |  | 会导致原有 zf  失效 (在 foldmethod=manual 时有效) | `zA` | 149 |
| `<C-n>` | N sil | 调用：NumberToggle() | `:call NumberToggle()<cr>` | 207 |
| `<leader>rw` | N | 调用：ChangeReadOnly() | `:call ChangeReadOnly()<cr>` | 218 |
| `k` | N | Treat long lines as break lines (useful when moving aroun... | `gk` | 268 |
| `j` | N | nnoremap gk k | `gj` | 270 |
| `<leader><F1>` | N | — | `: call GetCurFileFullPath()<cr>` | 293 |
| `<F1>` | N | — | `: call GetCurFileName()<cr>` | 309 |
| `<F1><F1>` | N | — | `: call GetCurFileNameAndText()<cr>` | 326 |
| `ft` | N | nnoremap <leader><F0> :echo expand('%:p')<CR> / nnoremap ... | `:set filetype=` | 338 |
| `<F2>` | N | 调用：HideNumber() | `:call HideNumber()<CR>` | 359 |
| `<F3>` |  | 插件 nerdtree 显示关闭快捷键 | `<leader>n` | 361 |
| `<F4>` | N | 执行 :set | `:set wrap! wrap?<CR>` | 362 |
| `<F5>` |  | toggle 'paste' option | `toggle 'paste' option` *(via set pastetoggle)* | 363 |
| `<F6>` | N | 执行 :exec | `:exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>` | 366 |
| `<leader><F6>` | N | 即 `:%!xxd -g 2` | `:%!xxd -g 2<CR>` | 367 |
| `<leader><leader><F6>` | N | 即 `:%!xxd -r` | `:%!xxd -r<CR>` | 368 |
| `<leader>j` |  | ##### 分屏窗口移动 在vim的各个窗口间切换 | `<C-W>j` | 371 |
| `<leader>k` |  | — | `<C-W>k` | 372 |
| `<leader>h` |  | — | `<C-W>h` | 373 |
| `<leader>l` |  | — | `<C-W>l` | 374 |
| `H` |  | 行首行尾 | `^` | 376 |
| `L` |  | 即 `$` | `$` | 377 |
| `O` |  | 一次跨10行 / 保留原来的 J 的功能 | `J` | 380 |
| `J` |  | 即 `10j` | `10j` | 381 |
| `K` |  | 即 `10k` | `10k` | 382 |
| `w=` | N | 更改窗口大小 | `:resize +3<CR>` | 384 |
| `w-` | N | 执行 :resize | `:resize -3<CR>` | 385 |
| `w,` | N | 执行 :vertical | `:vertical resize -3<CR>` | 386 |
| `w.` | N | 执行 :vertical | `:vertical resize +3<CR>` | 387 |
| `wa` | N | 当前窗口最大化, 高 | `<C-W>_` | 389 |
| `ws` | N | 当前窗口最大化, 宽, 注意要有反斜杠 | `<C-W>\\|` | 391 |
| `wd` | N | 恢复窗口大小默认分布 | `<C-W>=` | 393 |
| `ww` | N | 高和宽都最大化 | `<C-W>_<C-W>\\|` | 395 |
| `n` | N sil | ##### 搜索相关 / Keep search pattern at the center of the scr... | `nzz` | 399 |
| `N` | N sil | 即 `Nzz` | `Nzz` | 400 |
| `*` | N sil | 即 `*zz` | `*zz` | 401 |
| `#` | N sil | 即 `#zz` | `#zz` | 402 |
| `g*` | N sil | 即 `g*zz` | `g*zz` | 403 |
| `#` | N | switch # * | `*` | 405 |
| `*` | N | 即 `#` | `#` | 406 |
| `<silent><leader>/` |  | 去掉搜索高亮 | `:nohls<CR>` | 409 |
| `[b` | N | ##### tab/buffer相关 / :b1 :b2   :bf :bl | `:bprevious<cr>` | 413 |
| `]b` | N | 下一个 buffer | `:bnext<cr>` | 414 |
| `bj` | N | 上一个 buffer | `:bprevious<cr>` | 415 |
| `bk` | N | 下一个 buffer | `:bnext<cr>` | 416 |
| `bd` | N | 关闭当前 buffer | `:bdelete<cr>` | 417 |
| `bw` | N | 执行 :bwipeout | `:bwipeout<cr>` | 418 |
| `th` |  | http://vim.wikia.com/wiki/Alternative_tab_navigation / ht... | `:tabfirst<cr>` | 424 |
| `tl` |  | 最后一个 tab | `:tablast<cr>` | 425 |
| `tk` |  | 下一个 tab | `:tabnext<cr>` | 426 |
| `tj` |  | 执行 :tabprev | `:tabprev<cr>` | 427 |
| `td` |  | map <leader>tn :tabnext<cr> / map <leader>tp :tabprev<cr>... | `:tabclose<cr>` | 431 |
| `to` |  | map <leader>tm :tabm<cr> | `:tabnew<cr>` | 433 |
| `<leader>1` |  | normal模式下切换到确切的tab | `1gt` | 436 |
| `<leader>2` |  | 即 `2gt` | `2gt` | 437 |
| `<leader>3` |  | 即 `3gt` | `3gt` | 438 |
| `<leader>4` |  | 即 `4gt` | `4gt` | 439 |
| `<leader>5` |  | 即 `5gt` | `5gt` | 440 |
| `<leader>6` |  | 即 `6gt` | `6gt` | 441 |
| `<leader>7` |  | 即 `7gt` | `7gt` | 442 |
| `<leader>8` |  | 即 `8gt` | `8gt` | 443 |
| `<leader>9` |  | 即 `9gt` | `9gt` | 444 |
| `<leader>0` |  | 最后一个 tab | `:tablast<cr>` | 445 |
| `<leader>=` |  | 执行 :tabedit | `:tabedit<cr>` | 446 |
| `<leader>-` |  | 关闭当前 tab | `:tabclose<cr>` | 447 |
| `<` | V | ##### 选中及操作改键 / 调整缩进后自动选中，方便再次操作 | `<gv` | 458 |
| `>` | V | 即 `>gv` | `>gv` | 459 |
| `Y` |  | y$ -> Y Make Y behave like other capitals | `y$` | 461 |
| `<Leader>sa` |  | select all 全选 | `ggVG"` | 464 |
| `<leader>v` | N | select block | `V`}` | 466 |
| `w!!` | C | w!! to sudo & write a file | `w !sudo tee >/dev/null %` | 468 |
| `<leader>q` | N | Quickly close the current window | `:q<CR>` | 471 |
| `<leader>x` | N | 保存并退出 | `:x<CR>` | 472 |
| `ss` | N sil | 快速保存 快捷键 | `:w<CR>` | 474 |
| `qq` | N | 关闭当前窗口 | `:q<CR>` | 475 |
| `qa` | N | 关闭当前窗口 | `:qa<CR>` | 476 |
| `er` | N | 执行 :e | `:e<CR>` | 477 |
| `'` | N | Swap implementations of ` and ' jump to markers / By defa... | ``` | 482 |
| ``` | N | 即 `'` | `'` | 483 |
| `U` | N | remap U to <C-r> for easier redo | `<C-r>` | 486 |
| `<leader>ev` | N sil | Quickly edit/reload the vimrc file | `:e $MYVIMRC<CR>` | 488 |
| `<leader>sv` | N sil | 执行 :so | `:so $MYVIMRC<CR>` | 489 |
| `,y` | N | 设置快捷键将选中文本块复制至系统剪贴板 | `"+y` | 542 |
| `,y` | V | 即 `"+y` | `"+y` | 543 |
| `,d` | V | 即 `"+d` | `"+d` | 544 |
| `,p` | N | 设置快捷键将系统剪贴板内容粘贴至 vim | `"+p` | 546 |
| `,P` | N | 即 `"+p` | `"+p` | 547 |
| `,p` | V | 即 `"+p` | `"+p` | 548 |
| `,P` | V | 即 `"+P` | `"+P` | 549 |
| `<leader><leader>T` |  | set tags+=~/.vim/systags / set tags+=~/.vim/systags_local... | `:call Do_CsTag_Sys()<CR>` | 556 |
| `<leader>T` |  | 生成当前项目的 tags | `:call Do_CsTag()<CR>` | 577 |
| `fs` | N | 在当前文件中快速查找光标下的单词 / nmap <leader>s :lv /<c-r>=expand("<cwo... | `:lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>` | 600 |
| `<leader>z` | N | 调用：Zoom() | `:call Zoom()<CR>` | 616 |
| `f` |  | 调用：ShowFuncName() | `:call ShowFuncName() <CR>` | 713 |
| `co` | N | Quick | `:copen<cr>` | 722 |
| `cj` | N | quickfix 下一个 | `:cnext<cr>` | 723 |
| `ck` | N | quickfix 上一个 | `:cprevious<cr>` | 724 |
| `cc` | N | 关闭 quickfix 窗口 | `:cclose<cr>` | 725 |
| `ca` | N | quickfix 跳指定项 | `:cr<cr>` | 726 |
| `ce` | N | quickfix 显示全部 | `:cla<cr>` | 727 |
| `lo` | N | Location | `:lopen<cr>` | 730 |
| `lc` | N | 关闭 location list 窗口 | `:lclose<cr>` | 731 |
| `lj` | N | 跳转到不同的错误 | `:lnext<cr>` | 733 |
| `lk` | N | 执行 :lprevious | `:lprevious<cr>` | 734 |
| `la` | N | location list 跳指定项 | `:lr<cr>` | 735 |
| `le` | N | location list 显示全部 | `:lla<cr>` | 736 |
| `<2-LeftMouse>` |  | 双击跳转 | `<C-]>` | 739 |
| `<2-RightMouse>` |  | — | `<C-o>` | 740 |
| `<C-RightMouse>` |  | — | `<C-o>` | 741 |
| `<leader><LeftMouse>` |  | — | `<C-i>` | 742 |
| `oo` | N | — | `<C-o>` | 744 |
| `<leader>jf` | N | 调用：B_JsonFormat() | `:call B_JsonFormat()<cr>` | 754 |
| `hw` | N | 高亮当前单词，同时光标停留在当前单词不跳转，可能需要先使用 gd 高亮一次才会生效 | `:let @/=expand('<cword>')<cr>` | 764 |
| `tu` |  | set noimdisable / 下划线转驼峰 | `:'<,'> s/_\(\w\)/\u\1/g<cr>:'<,'> s/^\(\w\)/\U\1/g<cr>` | 768 |
| `tU` |  | 驼峰转下划线 | `:%s/\([^ .*+-]\)\([A-Z].\)/\1_\2/g<cr>ggguG` | 770 |
| `st` |  | 调用：GetCurTmpFileFullPath() | `:call GetCurTmpFileFullPath()<CR>` | 775 |
| `<leader>so` | N | nmap <leader>so :silent !open % > /dev/null 2>&1<CR> | `:!open %<CR>` | 790 |

### 主插件配置（vimrc.bundles_base）

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<leader>cd` | N | 执行 :AutoChangeDirectory | `:AutoChangeDirectory <cr>` | 159 |
| `<leader>i` |  | 执行 :Nine2IndentGuides | `:Nine2IndentGuides<cr>` | 166 |
| `<leader>,` |  | 清除尾部空白 | `:FixWhitespace<cr>` | 172 |
| `ek` | N sil | Plug 触发：ale_previous_wrap | `<Plug>(ale_previous_wrap)` | 251 |
| `ej` | N sil | Plug 触发：ale_next_wrap | `<Plug>(ale_next_wrap)` | 252 |
| `eh` | N sil | Plug 触发：ale_first | `<Plug>(ale_first)` | 253 |
| `el` | N sil | Plug 触发：ale_last | `<Plug>(ale_last)` | 254 |
| `fh` |  | let g:EasyMotion_startofline = 0 " keep cursor colum when... | `<Plug>(easymotion-linebackward)` | 284 |
| `fw` |  | Plug 触发：easymotion-w | `<Plug>(easymotion-w)` | 285 |
| `fj` |  | Plug 触发：easymotion-e | `<Plug>(easymotion-e)` | 286 |
| `fk` |  | Plug 触发：easymotion-b | `<Plug>(easymotion-b)` | 287 |
| `fl` |  | Plug 触发：easymotion-lineforward | `<Plug>(easymotion-lineforward)` | 288 |
| `<Leader><leader>.` |  | map fb <Plug>(easymotion-b) / map fe <Plug>(easymotion-e)... | `<Plug>(easymotion-repeat)` | 292 |
| `mm` | N | 切换书签 | `:BookmarkToggle<CR>` | 326 |
| `mi` | N | 为书签加注释 | `:BookmarkAnnotate<CR>` | 327 |
| `mn` | N | 下一个书签 | `:BookmarkNext<CR>` | 328 |
| `mp` | N | 上一个书签 | `:BookmarkPrev<CR>` | 329 |
| `ma` | N | 显示所有书签 | `:BookmarkShowAll<CR>` | 330 |
| `mc` | N | 清空当前 buffer 书签 | `:BookmarkClear<CR>` | 331 |
| `mx` | N | 清空当前 buffer 书签 | `:BookmarkClearAll<CR>` | 332 |
| `mkk` | N | 执行 :BookmarkMoveUp | `:BookmarkMoveUp` | 333 |
| `mjj` | N | 执行 :BookmarkMoveDown | `:BookmarkMoveDown` | 334 |
| `v` | V | Plug 触发：expand_region_expand | `<Plug>(expand_region_expand)` | 353 |
| `V` | V | Plug 触发：expand_region_shrink | `<Plug>(expand_region_shrink)` | 354 |
| `<C-m>` | N | MultiCursor next | `MultiCursor next` *(via g:multi_cursor_next_key)* | 361 |
| `<C-p>` | N | MultiCursor prev | `MultiCursor prev` *(via g:multi_cursor_prev_key)* | 362 |
| `<C-x>` | N | MultiCursor skip | `MultiCursor skip` *(via g:multi_cursor_skip_key)* | 363 |
| `<leader>f` | N | Leaderf <CR> | `Leaderf <CR>` *(via g:Lf_ShortcutF)* | 383 |
| `<leader>b` | N | Leaderf buffer<CR> | `Leaderf buffer<CR>` *(via g:Lf_ShortcutB)* | 384 |
| `gd` | N | 跳转快捷键 — --auto-jump=1：仅当结果只有 1 个时自动跳转，不再弹浮窗 / gd: 跳到光标下符号... | `:<C-U>Leaderf gtags --auto-jump=1 -d <C-R><C-W><CR>` | 411 |
| `gr` | N | gr: 找光标下符号的所有【引用】（哪些地方调用了它） | `:<C-U>Leaderf gtags --auto-jump=1 -r <C-R><C-W><CR>` | 413 |
| `gs` | N | gs: 找符号的所有【出现位置】（包括字符串字面量、注释中的同名出现） | `:<C-U>Leaderf gtags --auto-jump=1 -s <C-R><C-W><CR>` | 415 |
| `go` | N | go: 重新打开【上次的搜索结果】，无需重跑 | `:<C-U>Leaderf gtags --recall<CR>` | 417 |
| `<leader>\` |  | 调用：CtrlsfViewMode() | `:call CtrlsfViewMode()<cr>` | 494 |
| `\` | N | Plug 触发：CtrlSFCwordPath | `<Plug>CtrlSFCwordPath<CR>` | 495 |
| `\\` | N | 使用 normal 方式搜索 | `:let g:ctrlsf_default_view_mode_last = g:ctrlsf_default_view_mode<CR> :let g:...` | 498 |
| `<F7>` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | 500 |
| `sf` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | 501 |
| `sp` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF<CR>` | 502 |
| `<leader>aa` | N | 项目级 grep 搜索（侧边栏） | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>'<cr>` | 503 |
| `ag` | N | nmap <F7> :Ag -w <c-r>=expand("<cword>")<cr><cr> / 查找函数调用 | `:Ag -w <c-r>=expand("<cword>")<cr> \\| grep '<c-r>=expand("<cword>")<cr>('<cr>` | 511 |
| `<leader>ag` | N | 查询当前单词, 立刻查询 | `:Ag -w <c-r>=expand("<cword>")<cr><cr>` | 513 |
| `<leader>a` | N | Ag 默认查找当前单词，可修改, 不立刻查询 / nmap <leader>a :Ag <c-r>=expand(... | `:Ag '` | 516 |
| `<Leader>n` | sil | map <leader>n :NERDTreeToggle<CR> | `:NERDTreeFind<cr>` | 569 |
| `<Leader>nf` | sil | 打开NERDTree,定位到当前文件 | `:NERDTreeFind<cr>` | 592 |
| `<C-d>` | sil | 调整窗口大小 / http://129.226.226.195/post/22725.html | `:vertical resize 30<cr>` *au FileType nerdtree* | 596 |
| `<C-l>` | sil | 执行 :vertical | `:vertical resize +10<cr>` *au FileType nerdtree* | 597 |
| `<C-h>` | sil | 执行 :vertical | `:vertical resize -10<cr>` *au FileType nerdtree* | 598 |
| `<Leader>n` |  | — | `<plug>NERDTreeTabsToggle<CR>` | 605 |
| `<leader>m` | N | nmap <F9> :TagbarToggle<CR> | `:TagbarToggle<CR>` | 621 |
| `<leader>lt` | N | LocListToggle (ListToggle) | `LocListToggle (ListToggle)` *(via g:lt_location...)* | 779 |
| `<leader>qt` | N | QFixToggle (ListToggle) | `QFixToggle (ListToggle)` *(via g:lt_quickfix...)* | 780 |
| `<leader>cq` | N sil | 一键关闭所有辅助窗口（quickfix + location list + preview） / 适用场景：在主代... | `:cclose<bar>lclose<bar>pclose<CR>` | 784 |
| `ga` | V | 对齐选区/动作（vim-easy-align） | `<Plug>(EasyAlign)` | 787 |
| `ga` | N | 对齐选区/动作（vim-easy-align） | `<Plug>(EasyAlign)` | 788 |
| `<Leader>r` | N | Plug 触发：quickrun | `<Plug>(quickrun)` | 804 |
| `<F10>` |  | 执行 :QuickRun | `:QuickRun<CR>` | 805 |
| `uh` |  | 执行 :CopyrightUpdate | `:CopyrightUpdate<cr>` | 827 |
| `<silent><expr>` | I | — | `( complete_parameter#pre_complete("()")` | 853 |
| `<c-j>` | S | Plug 触发：complete_parameter#goto_next_parameter | `<Plug>(complete_parameter#goto_next_parameter)` | 854 |
| `<c-j>` | I | Plug 触发：complete_parameter#goto_next_parameter | `<Plug>(complete_parameter#goto_next_parameter)` | 855 |
| `<c-k>` | S | Plug 触发：complete_parameter#goto_previous_parameter | `<Plug>(complete_parameter#goto_previous_parameter)` | 856 |
| `<c-k>` | I | Plug 触发：complete_parameter#goto_previous_parameter | `<Plug>(complete_parameter#goto_previous_parameter)` | 857 |
| `sj` | N | 把单行拆成多行 | `:SplitjoinSplit<cr>` | 865 |
| `sk` | N | 把多行合成单行 | `:SplitjoinJoin<cr>` | 866 |
| `p` | N buf | — | `<plug>(qf-preview-open)` *autocmd FileType qf* | 884 |

### 补全相关（vimrc.bundles_complex）

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<F8>` |  | 通用格式化（vim-autoformat） | `:Autoformat<CR>` | 24 |
| `<c-j>` | I | UltiSnips JumpForward | `UltiSnips JumpForward` *(via g:UltiSnipsJumpForwardTrigger)* | 46 |
| `<c-k>` | I | UltiSnips JumpBackward | `UltiSnips JumpBackward` *(via g:UltiSnipsJumpBackwardTrigger)* | 47 |
| `<leader>ds` |  | 在 Dash 中查文档 | `:Dash<cr>` | 60 |
| `<C-k><C-o>` | I | <C-x><C-x> invokes completions of github-complete.vim / a... | `<Plug>(github-complete-manual-completion)` | 69 |
| `<silent><expr>` | I | — | `<Tab> <SID>SmartTab()` | 94 |
| `<Leader>cp` | N | 显示建议面板 | `:Copilot panel<CR>` | 109 |

### YouCompleteMe（vimrc.bundles_ycm）

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `ff` | N | 定位当前函数、变量的定义处 | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | 68 |
| `fi` | N | YouCompleteMe 命令 | `:YcmCompleter GoToImplementation<CR>` | 69 |
| `<leader>fi` | N | YouCompleteMe 命令 | `:YcmCompleter GoToImplementation<CR>` | 70 |
| `fr` | N | YouCompleteMe 命令 | `:YcmCompleter GoToReferences<CR>` | 71 |
| `<leader>fr` | N | YouCompleteMe 命令 | `:YcmCompleter GoToReferences<CR>` | 72 |
| `<C-]>` | N | nnoremap <leader>] :YcmCompleter GoToDefinitionElseDeclar... | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | 76 |
| `<leader>e` | N | 执行 :YcmDiags | `:YcmDiags<CR>` | 77 |
| `<Space>` | N | nmap <leader>d <plug>(YCMHover) | `<plug>(YCMHover)` | 80 |

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
| `gh` | N | 调用：CustomGitGutterLineHights() | `:call CustomGitGutterLineHights()<CR>` | 37 |
| `gb` | N | 使用命令 / GStatue, help fugitive / 使用 Glog 可查看历史版本文件 | `:G blame<CR>` | 44 |
| `<leader>gst` | N | <leader>gst: git status（让出 gs 给 LeaderF gtags -s） | `:G status<CR>` | 46 |
| `g<space>` | N | :Gbrowse | `:GBrowse<CR>` | 50 |
| `<leader>ht` |  | 切换 undo tree | `:GundoToggle<CR>` | 59 |
| `gm` |  | 执行 :GitMessenger | `:GitMessenger<CR>` | 67 |

### 文件类型：go

| 按键 | 模式 | 说明 | 命令 | 行号 |
|------|:----:|------|------|------|
| `<leader>gi` | N | 整理 import | `:GoImports<CR>` | 38 |
| `<C-n>` | I | 修改补全触发 | `<C-x><C-o>` | 80 |
| `<leader>s` | N buf sil | — | `:<C-u>call go#def#Jump("split")<CR>` | 85 |
| `<leader>v` | N buf sil | — | `:<C-u>call go#def#Jump("vsplit")<CR>` | 86 |
| `ff` | N | au FileType go nnoremap <buffer> <silent> <leader>t :<C-u... | `:GoDef<CR>` | 89 |
| `<2-LeftMouse>` | N | 跳到定义（gopls） | `:GoDef<CR>` | 90 |
| `fi` | N | 找接口实现 | `:GoImplements<CR>` | 91 |
| `<F6>` | N | 找接口实现 | `:GoImplements<CR>:cfirst<CR>` | 92 |
| `fr` | N | 找所有引用（gopls） | `:GoReferrers<CR>` | 93 |
| `<F8>` | N | go 文件下, F8 不做 Format 使用, go 有自己的 fmt | `:GoReferrers<CR>` | 95 |
| `fs` | N | 自动导入结构体字段 | `:GoFillStruct<cr>` | 97 |
| `<Leader>d` | N | au FileType go nmap <leader><F7> :GoReferrers<cr> / au Fi... | `:GoDoc<cr>` | 100 |
| `wh` | N | SameIds 配色： hi CursorColumn ctermbg=26 | `:GoSameIds<cr>` | 102 |
| `whc` | N | 高亮当前作用域同名标识符 | `:GoSameIdsClear<cr>` | 103 |
| `<leader>rn` |  | 重命名符号 | `:GoRename<cr>` | 104 |
| `ga` | N | 自动导入包, 格式化 imports | `:GoAddTag json` | 107 |
| `gaj` | N | 为 struct 字段添加 tag | `:GoAddTag json<CR>` | 108 |
| `gas` | N | 为 struct 字段添加 tag | `:GoAddTag schema<CR>` | 109 |
| `gad` | N | 为 struct 字段添加 tag | `:GoAddTag db<CR>` | 110 |
| `grt` | N | 移除 struct tag | `:GoRemoveTags db` | 111 |
| `grj` | N | 移除 struct tag | `:GoRemoveTags json<CR>` | 112 |
| `grd` | N | 移除 struct tag | `:GoRemoveTags db<CR>` | 113 |
| `<Leader>e` | N | go build 检查错误 | `:GoBuild<cr>` | 116 |
| `<Leader>gb` | N | Go 编译当前包 | `:GoBuild<cr>` | 117 |
| `cl` | N | 运行 Go metalinter | `:GoMetaLinter<cr>` | 118 |
| `<F10>` | N | 运行 Go metalinter | `:GoMetaLinter<CR>` | 119 |
| `ek` | N sil | quickfix 上一个 | `:cprevious<cr>` | 120 |
| `ej` | N sil | quickfix 下一个 | `:cnext<cr>` | 121 |
| `eh` | N sil | quickfix 跳指定项 | `:cr<cr>` | 122 |
| `el` | N sil | quickfix 显示全部 | `:cla<cr>` | 123 |
| `<Leader>tt` | N | 运行测试函数 | `:call Nine2GoTest()<cr>` | 125 |
| `<Leader>tb` | N | 调用：Nine2GoBench() | `:call Nine2GoBench()<cr>` | 126 |
| `<Leader>tf` | N | 调用：Nine2GoTestFunc() | `:call Nine2GoTestFunc()<cr>` | 127 |
| `<F9>` | N | 调用：Nine2GoTestFunc() | `:call Nine2GoTestFunc()<CR>` | 128 |
| `<leader><F9>` | N | 调用：Nine2GoBenchmarkFunc() | `:call Nine2GoBenchmarkFunc()<CR>` | 129 |
| `<leader>bb` |  | let g:delve_backend = "native" | `:DlvAddBreakpoint<cr>` | 214 |
| `<leader>ba` |  | delve toggle tracepoint | `:DlvToggleTracepoint<cr>` | 215 |
| `<leader>br` |  | delve 删除断点 | `:DlvRemoveBreakpoint<cr>` | 216 |
| `<leader>bc` |  | au FileType go map <leader>be :DlvRemoveTracepoint<cr> | `:DlvClearAll<cr>` | 218 |
| `<leader>bd` |  | au FileType go map <leader>bt :DlvTest<cr> | `:DlvDebug<cr>` | 220 |
| `<leader>gt` |  | 运行 Go 测试 | `:GoTests<cr>` | 228 |

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

本表由 `tools/scan_keys.py`（如有）或手动 grep 生成；新增/修改快捷键时请重新生成本表。

生成命令（参考）：
```bash
python3 /tmp/gen_keys_md.py
```

**最后更新**: 2026-05-08