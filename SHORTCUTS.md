# Vim 快捷键速查表

**生成日期**: 2026-05-08
**总数**: 275 个映射（含 nmap/imap/vmap/smap/map + 变量配置式）
**全局映射**: 217（不含 buffer-local 的 FileType 限定项）

> **mode 列说明**：N=normal, I=insert, V=visual, S=select, C=cmdline；buf=buffer-local
> **leader 设置**：`<leader>` = `<Space>`（vimrc:13）

---

## 一、全局快捷键（按字母排序）

> 排序键：`<leader>X` 取 X，`gd` 取 g，`<F8>` 排到最后。

| 按键 | 模式 | 命令 | 文件 |
|------|:----:|------|------|
| `#` | N sil | `#zz` | `vimrc.config_base:402` |
| `#` | N | `*` | `vimrc.config_base:405` |
| `'` | N | ``` | `vimrc.config_base:482` |
| `*` | N sil | `*zz` | `vimrc.config_base:401` |
| `*` | N | `#` | `vimrc.config_base:406` |
| `<leader>,` |  | `:FixWhitespace<cr>` | `vimrc.bundles_base:172` |
| `,,` | I | `<Esc>` | `vimrc:16` |
| `,d` | V | `"+d` | `vimrc.config_base:544` |
| `,P` | N | `"+p` | `vimrc.config_base:547` |
| `,P` | V | `"+P` | `vimrc.config_base:549` |
| `,p` | N | `"+p` | `vimrc.config_base:546` |
| `,p` | V | `"+p` | `vimrc.config_base:548` |
| `,y` | N | `"+y` | `vimrc.config_base:542` |
| `,y` | V | `"+y` | `vimrc.config_base:543` |
| `<leader>-` |  | `:tabclose<cr>` | `vimrc.config_base:447` |
| `<leader>0` |  | `:tablast<cr>` | `vimrc.config_base:445` |
| `<leader>1` |  | `1gt` | `vimrc.config_base:436` |
| `<leader>2` |  | `2gt` | `vimrc.config_base:437` |
| `<leader>3` |  | `3gt` | `vimrc.config_base:438` |
| `<leader>4` |  | `4gt` | `vimrc.config_base:439` |
| `<leader>5` |  | `5gt` | `vimrc.config_base:440` |
| `<leader>6` |  | `6gt` | `vimrc.config_base:441` |
| `<leader>7` |  | `7gt` | `vimrc.config_base:442` |
| `<leader>8` |  | `8gt` | `vimrc.config_base:443` |
| `<leader>9` |  | `9gt` | `vimrc.config_base:444` |
| `;` | N | `:` | `vimrc:19` |
| `<leader>=` |  | `:tabedit<cr>` | `vimrc.config_base:446` |
| `>` | V | `>gv` | `vimrc.config_base:459` |
| `[b` | N | `:bprevious<cr>` | `vimrc.config_base:413` |
| `<leader>\` |  | `:call CtrlsfViewMode()<cr>` | `vimrc.bundles_base:494` |
| `\` | N | `<Plug>CtrlSFCwordPath<CR>` | `vimrc.bundles_base:495` |
| `\\` | N | `:let g:ctrlsf_default_view_mode_last = g:ctrlsf_default_view_mode<CR> :let g:...` | `vimrc.bundles_base:498` |
| `]b` | N | `:bnext<cr>` | `vimrc.config_base:414` |
| ``` | N | `'` | `vimrc.config_base:483` |
| `<leader>a` | N | `:Ag '` | `vimrc.bundles_base:516` |
| `<leader>aa` | N | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>'<cr>` | `vimrc.bundles_base:503` |
| `<leader>ag` | N | `:Ag -w <c-r>=expand("<cword>")<cr><cr>` | `vimrc.bundles_base:513` |
| `ag` | N | `:Ag -w <c-r>=expand("<cword>")<cr> \\| grep '<c-r>=expand("<cword>")<cr>('<cr>` | `vimrc.bundles_base:511` |
| `bd` | N | `:bdelete<cr>` | `vimrc.config_base:417` |
| `bj` | N | `:bprevious<cr>` | `vimrc.config_base:415` |
| `bk` | N | `:bnext<cr>` | `vimrc.config_base:416` |
| `bw` | N | `:bwipeout<cr>` | `vimrc.config_base:418` |
| `ca` | N | `:cr<cr>` | `vimrc.config_base:726` |
| `cc` | N | `:cclose<cr>` | `vimrc.config_base:725` |
| `<leader>cd` | N | `:AutoChangeDirectory <cr>` | `vimrc.bundles_base:159` |
| `ce` | N | `:cla<cr>` | `vimrc.config_base:727` |
| `<Leader>ch` | N | `:AS<CR>` | `filetype_bundles/cpp.vim:18` |
| `cj` | N | `:cnext<cr>` | `vimrc.config_base:723` |
| `ck` | N | `:cprevious<cr>` | `vimrc.config_base:724` |
| `co` | N | `:copen<cr>` | `vimrc.config_base:722` |
| `<Leader>cp` | N | `:Copilot panel<CR>` | `vimrc.bundles_complex:109` |
| `<leader>cq` | N sil | `:cclose<bar>lclose<bar>pclose<CR>` | `vimrc.bundles_base:784` |
| `<leader>ds` |  | `:Dash<cr>` | `vimrc.bundles_complex:60` |
| `<leader>e` | N | `:YcmDiags<CR>` | `vimrc.bundles_ycm:77` |
| `eh` | N sil | `<Plug>(ale_first)` | `vimrc.bundles_base:253` |
| `ej` | N sil | `<Plug>(ale_next_wrap)` | `vimrc.bundles_base:252` |
| `ek` | N sil | `<Plug>(ale_previous_wrap)` | `vimrc.bundles_base:251` |
| `el` | N sil | `<Plug>(ale_last)` | `vimrc.bundles_base:254` |
| `er` | N | `:e<CR>` | `vimrc.config_base:477` |
| `<leader>ev` | N sil | `:e $MYVIMRC<CR>` | `vimrc.config_base:488` |
| `f` |  | `:call ShowFuncName() <CR>` | `vimrc.config_base:713` |
| `ff` | N | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | `vimrc.bundles_ycm:68` |
| `fh` |  | `<Plug>(easymotion-linebackward)` | `vimrc.bundles_base:284` |
| `<leader>fi` | N | `:YcmCompleter GoToImplementation<CR>` | `vimrc.bundles_ycm:70` |
| `fi` | N | `:YcmCompleter GoToImplementation<CR>` | `vimrc.bundles_ycm:69` |
| `fj` |  | `<Plug>(easymotion-e)` | `vimrc.bundles_base:286` |
| `fk` |  | `<Plug>(easymotion-b)` | `vimrc.bundles_base:287` |
| `fl` |  | `<Plug>(easymotion-lineforward)` | `vimrc.bundles_base:288` |
| `<leader>fr` | N | `:YcmCompleter GoToReferences<CR>` | `vimrc.bundles_ycm:72` |
| `fr` | N | `:YcmCompleter GoToReferences<CR>` | `vimrc.bundles_ycm:71` |
| `fs` | N | `:lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>` | `vimrc.config_base:600` |
| `ft` | N | `:set filetype=` | `vimrc.config_base:338` |
| `fw` |  | `<Plug>(easymotion-w)` | `vimrc.bundles_base:285` |
| `g*` | N sil | `g*zz` | `vimrc.config_base:403` |
| `g<space>` | N | `:GBrowse<CR>` | `filetype_bundles/git.vim:50` |
| `ga` | V | `<Plug>(EasyAlign)` | `vimrc.bundles_base:787` |
| `ga` | N | `<Plug>(EasyAlign)` | `vimrc.bundles_base:788` |
| `gb` | N | `:G blame<CR>` | `filetype_bundles/git.vim:44` |
| `gd` | N | `:<C-U>Leaderf gtags --auto-jump=1 -d <C-R><C-W><CR>` | `vimrc.bundles_base:411` |
| `gh` | N | `:call CustomGitGutterLineHights()<CR>` | `filetype_bundles/git.vim:37` |
| `gm` |  | `:GitMessenger<CR>` | `filetype_bundles/git.vim:67` |
| `gn` | N | `:GitGutterNextHunk<CR>` | `filetype_bundles/git.vim:25` |
| `go` | N | `:<C-U>Leaderf gtags --recall<CR>` | `vimrc.bundles_base:417` |
| `gp` | N | `:GitGutterPrevHunk<CR>` | `filetype_bundles/git.vim:24` |
| `gr` | N | `:<C-U>Leaderf gtags --auto-jump=1 -r <C-R><C-W><CR>` | `vimrc.bundles_base:413` |
| `gs` | N | `:<C-U>Leaderf gtags --auto-jump=1 -s <C-R><C-W><CR>` | `vimrc.bundles_base:415` |
| `<leader>gst` | N | `:G status<CR>` | `filetype_bundles/git.vim:46` |
| `gt` | N | `:GitGutterToggle<CR>` | `filetype_bundles/git.vim:23` |
| `gz` | N | `:GitGutterUndoHunk<CR>` | `filetype_bundles/git.vim:28` |
| `<leader>h` |  | `<C-W>h` | `vimrc.config_base:373` |
| `H` |  | `^` | `vimrc.config_base:376` |
| `<leader>ht` |  | `:GundoToggle<CR>` | `filetype_bundles/git.vim:59` |
| `hw` | N | `:let @/=expand('<cword>')<cr>` | `vimrc.config_base:764` |
| `<leader>i` |  | `:Nine2IndentGuides<cr>` | `vimrc.bundles_base:166` |
| `<leader>j` |  | `<C-W>j` | `vimrc.config_base:371` |
| `J` |  | `10j` | `vimrc.config_base:381` |
| `j` | N | `gj` | `vimrc.config_base:270` |
| `<leader>jf` | N | `:call B_JsonFormat()<cr>` | `vimrc.config_base:754` |
| `<leader>k` |  | `<C-W>k` | `vimrc.config_base:372` |
| `K` |  | `10k` | `vimrc.config_base:382` |
| `k` | N | `gk` | `vimrc.config_base:268` |
| `<leader>l` |  | `<C-W>l` | `vimrc.config_base:374` |
| `L` |  | `$` | `vimrc.config_base:377` |
| `la` | N | `:lr<cr>` | `vimrc.config_base:735` |
| `lc` | N | `:lclose<cr>` | `vimrc.config_base:731` |
| `le` | N | `:lla<cr>` | `vimrc.config_base:736` |
| `<leader>li` | N | `:LeetCodeSignIn<cr>` | `filetype_bundles/leetcode.vim:20` |
| `lj` | N | `:lnext<cr>` | `vimrc.config_base:733` |
| `lk` | N | `:lprevious<cr>` | `vimrc.config_base:734` |
| `<leader>ll` | N | `:LeetCodeList<cr>` | `filetype_bundles/leetcode.vim:17` |
| `lo` | N | `:lopen<cr>` | `vimrc.config_base:730` |
| `<leader>ls` | N | `:LeetCodeSubmit<cr>` | `filetype_bundles/leetcode.vim:19` |
| `<leader>lt` | N | `:LeetCodeTest<cr>` | `filetype_bundles/leetcode.vim:18` |
| `<leader>m` | N | `:TagbarToggle<CR>` | `vimrc.bundles_base:621` |
| `ma` | N | `:BookmarkShowAll<CR>` | `vimrc.bundles_base:330` |
| `mc` | N | `:BookmarkClear<CR>` | `vimrc.bundles_base:331` |
| `mi` | N | `:BookmarkAnnotate<CR>` | `vimrc.bundles_base:327` |
| `mjj` | N | `:BookmarkMoveDown` | `vimrc.bundles_base:334` |
| `mkk` | N | `:BookmarkMoveUp` | `vimrc.bundles_base:333` |
| `mm` | N | `:BookmarkToggle<CR>` | `vimrc.bundles_base:326` |
| `mn` | N | `:BookmarkNext<CR>` | `vimrc.bundles_base:328` |
| `mp` | N | `:BookmarkPrev<CR>` | `vimrc.bundles_base:329` |
| `mx` | N | `:BookmarkClearAll<CR>` | `vimrc.bundles_base:332` |
| `<Leader>n` | sil | `:NERDTreeFind<cr>` | `vimrc.bundles_base:569` |
| `<Leader>n` |  | `<plug>NERDTreeTabsToggle<CR>` | `vimrc.bundles_base:605` |
| `N` | N sil | `Nzz` | `vimrc.config_base:400` |
| `n` | N sil | `nzz` | `vimrc.config_base:399` |
| `<Leader>nf` | sil | `:NERDTreeFind<cr>` | `vimrc.bundles_base:592` |
| `O` |  | `J` | `vimrc.config_base:380` |
| `oo` | N | `<C-o>` | `vimrc.config_base:744` |
| `<leader>q` | N | `:q<CR>` | `vimrc.config_base:471` |
| `qa` | N | `:qa<CR>` | `vimrc.config_base:476` |
| `qq` | N | `:q<CR>` | `vimrc.config_base:475` |
| `<Leader>r` | N | `<Plug>(quickrun)` | `vimrc.bundles_base:804` |
| `<Leader>r` | N sil | `<Plug>TranslateR` | `filetype_bundles/dependout.vim:24` |
| `<Leader>r` | V sil | `<Plug>TranslateRV` | `filetype_bundles/dependout.vim:25` |
| `<leader>rw` | N | `:call ChangeReadOnly()<cr>` | `vimrc.config_base:218` |
| `<Leader>sa` |  | `ggVG"` | `vimrc.config_base:464` |
| `<Leader>sch` | N | `:A<CR>` | `filetype_bundles/cpp.vim:20` |
| `sf` | N | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | `vimrc.bundles_base:501` |
| `sj` | N | `:SplitjoinSplit<cr>` | `vimrc.bundles_base:865` |
| `sk` | N | `:SplitjoinJoin<cr>` | `vimrc.bundles_base:866` |
| `<leader>so` | N | `:!open %<CR>` | `vimrc.config_base:790` |
| `sp` | N | `:CtrlSF<CR>` | `vimrc.bundles_base:502` |
| `ss` | N sil | `:w<CR>` | `vimrc.config_base:474` |
| `st` |  | `:call GetCurTmpFileFullPath()<CR>` | `vimrc.config_base:775` |
| `<leader>sv` | N sil | `:so $MYVIMRC<CR>` | `vimrc.config_base:489` |
| `<Leader>t` | N sil | `<Plug>Translate` | `filetype_bundles/dependout.vim:18` |
| `<Leader>t` | V sil | `<Plug>TranslateV` | `filetype_bundles/dependout.vim:19` |
| `<leader>T` |  | `:call Do_CsTag()<CR>` | `vimrc.config_base:577` |
| `td` |  | `:tabclose<cr>` | `vimrc.config_base:431` |
| `th` |  | `:tabfirst<cr>` | `vimrc.config_base:424` |
| `tj` |  | `:tabprev<cr>` | `vimrc.config_base:427` |
| `tk` |  | `:tabnext<cr>` | `vimrc.config_base:426` |
| `tl` |  | `:tablast<cr>` | `vimrc.config_base:425` |
| `to` |  | `:tabnew<cr>` | `vimrc.config_base:433` |
| `tU` |  | `:%s/\([^ .*+-]\)\([A-Z].\)/\1_\2/g<cr>ggguG` | `vimrc.config_base:770` |
| `tu` |  | `:'<,'> s/_\(\w\)/\u\1/g<cr>:'<,'> s/^\(\w\)/\U\1/g<cr>` | `vimrc.config_base:768` |
| `U` | N | `<C-r>` | `vimrc.config_base:486` |
| `uh` |  | `:CopyrightUpdate<cr>` | `vimrc.bundles_base:827` |
| `<leader>v` | N | `V`}` | `vimrc.config_base:466` |
| `V` | V | `<Plug>(expand_region_shrink)` | `vimrc.bundles_base:354` |
| `v` | V | `<Plug>(expand_region_expand)` | `vimrc.bundles_base:353` |
| `<Leader>w` | N sil | `<Plug>TranslateW` | `filetype_bundles/dependout.vim:21` |
| `<Leader>w` | V sil | `<Plug>TranslateWV` | `filetype_bundles/dependout.vim:22` |
| `w!!` | C | `w !sudo tee >/dev/null %` | `vimrc.config_base:468` |
| `w,` | N | `:vertical resize -3<CR>` | `vimrc.config_base:386` |
| `w-` | N | `:resize -3<CR>` | `vimrc.config_base:385` |
| `w.` | N | `:vertical resize +3<CR>` | `vimrc.config_base:387` |
| `w=` | N | `:resize +3<CR>` | `vimrc.config_base:384` |
| `wa` | N | `<C-W>_` | `vimrc.config_base:389` |
| `wd` | N | `<C-W>=` | `vimrc.config_base:393` |
| `ws` | N | `<C-W>\\|` | `vimrc.config_base:391` |
| `ww` | N | `<C-W>_<C-W>\\|` | `vimrc.config_base:395` |
| `<Leader>x` | N sil | `<Plug>TranslateX` | `filetype_bundles/dependout.vim:27` |
| `<leader>x` | N | `:x<CR>` | `vimrc.config_base:472` |
| `Y` |  | `y$` | `vimrc.config_base:461` |
| `<leader>z` | N | `:call Zoom()<CR>` | `vimrc.config_base:616` |
| `zf` |  | `zA` | `vimrc.config_base:149` |
| `<leader>zz` |  | `:call ToggleFold()<cr>` | `vimrc.config_base:146` |
| `zz` |  | `za` | `vimrc.config_base:147` |
| `<C-,>` |  | `<Esc>` | `vimrc:17` |
| `<C-]>` | N | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | `vimrc.bundles_ycm:76` |
| `<c-j>` | S | `<Plug>(complete_parameter#goto_next_parameter)` | `vimrc.bundles_base:854` |
| `<c-j>` | I | `<Plug>(complete_parameter#goto_next_parameter)` | `vimrc.bundles_base:855` |
| `<c-k>` | S | `<Plug>(complete_parameter#goto_previous_parameter)` | `vimrc.bundles_base:856` |
| `<c-k>` | I | `<Plug>(complete_parameter#goto_previous_parameter)` | `vimrc.bundles_base:857` |
| `<C-n>` | N sil | `:call NumberToggle()<cr>` | `vimrc.config_base:207` |
| `<C-n>` | I | `<C-x><C-o>` | `filetype_bundles/go.vim:80` |
| `<F1>` | N | `: call GetCurFileName()<cr>` | `vimrc.config_base:309` |
| `<leader><F1>` | N | `: call GetCurFileFullPath()<cr>` | `vimrc.config_base:293` |
| `<F2>` | N | `:call HideNumber()<CR>` | `vimrc.config_base:359` |
| `<F3>` |  | `<leader>n` | `vimrc.config_base:361` |
| `<F4>` | N | `:set wrap! wrap?<CR>` | `vimrc.config_base:362` |
| `<F6>` | N | `:exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>` | `vimrc.config_base:366` |
| `<leader><F6>` | N | `:%!xxd -g 2<CR>` | `vimrc.config_base:367` |
| `<F7>` | N | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | `vimrc.bundles_base:500` |
| `<F8>` |  | `:Autoformat<CR>` | `vimrc.bundles_complex:24` |
| `<F8>` |  | `:F8FormatFile<CR>` | `vimrc.bundles_simple:42` |
| `<F10>` |  | `:QuickRun<CR>` | `vimrc.bundles_base:805` |
| `<` | V | `<gv` | `vimrc.config_base:458` |
| `<2-LeftMouse>` |  | `<C-]>` | `vimrc.config_base:739` |
| `<2-RightMouse>` |  | `<C-o>` | `vimrc.config_base:740` |
| `<C-k><C-o>` | I | `<Plug>(github-complete-manual-completion)` | `vimrc.bundles_complex:69` |
| `<C-RightMouse>` |  | `<C-o>` | `vimrc.config_base:741` |
| `<F1><F1>` | N | `: call GetCurFileNameAndText()<cr>` | `vimrc.config_base:326` |
| `<Leader><leader>.` |  | `<Plug>(easymotion-repeat)` | `vimrc.bundles_base:292` |
| `<leader><leader><F6>` | N | `:%!xxd -r<CR>` | `vimrc.config_base:368` |
| `<leader><leader>T` |  | `:call Do_CsTag_Sys()<CR>` | `vimrc.config_base:556` |
| `<leader><LeftMouse>` |  | `<C-i>` | `vimrc.config_base:742` |
| `<ScrollWheelDown>` |  | `<C-E><C-E><C-E>` | `vimrc.config_base:44` |
| `<ScrollWheelUp>` |  | `<C-Y><C-Y><C-Y>` | `vimrc.config_base:43` |
| `<silent><expr>` | I | `( complete_parameter#pre_complete("()")` | `vimrc.bundles_base:853` |
| `<silent><expr>` | I | `<Tab> <SID>SmartTab()` | `vimrc.bundles_complex:94` |
| `<silent><leader>/` |  | `:nohls<CR>` | `vimrc.config_base:409` |
| `<Space>` | N | `<plug>(YCMHover)` | `vimrc.bundles_ycm:80` |
| `<space><F2>` |  | `:call quickui#menu#open()<cr>` | `filetype_bundles/quickui.vim:60` |

---

## 二、按文件 / 插件分组

### 入口（vimrc）

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `,,` | I | `<Esc>` | 16 |
| `<C-,>` |  | `<Esc>` | 17 |
| `;` | N | `:` | 19 |

### 基础配置（vimrc.config_base）

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `<ScrollWheelUp>` |  | `<C-Y><C-Y><C-Y>` | 43 |
| `<ScrollWheelDown>` |  | `<C-E><C-E><C-E>` | 44 |
| `<leader>zz` |  | `:call ToggleFold()<cr>` | 146 |
| `zz` |  | `za` | 147 |
| `zf` |  | `zA` | 149 |
| `<C-n>` | N sil | `:call NumberToggle()<cr>` | 207 |
| `<leader>rw` | N | `:call ChangeReadOnly()<cr>` | 218 |
| `k` | N | `gk` | 268 |
| `j` | N | `gj` | 270 |
| `<leader><F1>` | N | `: call GetCurFileFullPath()<cr>` | 293 |
| `<F1>` | N | `: call GetCurFileName()<cr>` | 309 |
| `<F1><F1>` | N | `: call GetCurFileNameAndText()<cr>` | 326 |
| `ft` | N | `:set filetype=` | 338 |
| `<F2>` | N | `:call HideNumber()<CR>` | 359 |
| `<F3>` |  | `<leader>n` | 361 |
| `<F4>` | N | `:set wrap! wrap?<CR>` | 362 |
| `<F5>` |  | `toggle 'paste' option` *(via set pastetoggle)* | 363 |
| `<F6>` | N | `:exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>` | 366 |
| `<leader><F6>` | N | `:%!xxd -g 2<CR>` | 367 |
| `<leader><leader><F6>` | N | `:%!xxd -r<CR>` | 368 |
| `<leader>j` |  | `<C-W>j` | 371 |
| `<leader>k` |  | `<C-W>k` | 372 |
| `<leader>h` |  | `<C-W>h` | 373 |
| `<leader>l` |  | `<C-W>l` | 374 |
| `H` |  | `^` | 376 |
| `L` |  | `$` | 377 |
| `O` |  | `J` | 380 |
| `J` |  | `10j` | 381 |
| `K` |  | `10k` | 382 |
| `w=` | N | `:resize +3<CR>` | 384 |
| `w-` | N | `:resize -3<CR>` | 385 |
| `w,` | N | `:vertical resize -3<CR>` | 386 |
| `w.` | N | `:vertical resize +3<CR>` | 387 |
| `wa` | N | `<C-W>_` | 389 |
| `ws` | N | `<C-W>\\|` | 391 |
| `wd` | N | `<C-W>=` | 393 |
| `ww` | N | `<C-W>_<C-W>\\|` | 395 |
| `n` | N sil | `nzz` | 399 |
| `N` | N sil | `Nzz` | 400 |
| `*` | N sil | `*zz` | 401 |
| `#` | N sil | `#zz` | 402 |
| `g*` | N sil | `g*zz` | 403 |
| `#` | N | `*` | 405 |
| `*` | N | `#` | 406 |
| `<silent><leader>/` |  | `:nohls<CR>` | 409 |
| `[b` | N | `:bprevious<cr>` | 413 |
| `]b` | N | `:bnext<cr>` | 414 |
| `bj` | N | `:bprevious<cr>` | 415 |
| `bk` | N | `:bnext<cr>` | 416 |
| `bd` | N | `:bdelete<cr>` | 417 |
| `bw` | N | `:bwipeout<cr>` | 418 |
| `th` |  | `:tabfirst<cr>` | 424 |
| `tl` |  | `:tablast<cr>` | 425 |
| `tk` |  | `:tabnext<cr>` | 426 |
| `tj` |  | `:tabprev<cr>` | 427 |
| `td` |  | `:tabclose<cr>` | 431 |
| `to` |  | `:tabnew<cr>` | 433 |
| `<leader>1` |  | `1gt` | 436 |
| `<leader>2` |  | `2gt` | 437 |
| `<leader>3` |  | `3gt` | 438 |
| `<leader>4` |  | `4gt` | 439 |
| `<leader>5` |  | `5gt` | 440 |
| `<leader>6` |  | `6gt` | 441 |
| `<leader>7` |  | `7gt` | 442 |
| `<leader>8` |  | `8gt` | 443 |
| `<leader>9` |  | `9gt` | 444 |
| `<leader>0` |  | `:tablast<cr>` | 445 |
| `<leader>=` |  | `:tabedit<cr>` | 446 |
| `<leader>-` |  | `:tabclose<cr>` | 447 |
| `<` | V | `<gv` | 458 |
| `>` | V | `>gv` | 459 |
| `Y` |  | `y$` | 461 |
| `<Leader>sa` |  | `ggVG"` | 464 |
| `<leader>v` | N | `V`}` | 466 |
| `w!!` | C | `w !sudo tee >/dev/null %` | 468 |
| `<leader>q` | N | `:q<CR>` | 471 |
| `<leader>x` | N | `:x<CR>` | 472 |
| `ss` | N sil | `:w<CR>` | 474 |
| `qq` | N | `:q<CR>` | 475 |
| `qa` | N | `:qa<CR>` | 476 |
| `er` | N | `:e<CR>` | 477 |
| `'` | N | ``` | 482 |
| ``` | N | `'` | 483 |
| `U` | N | `<C-r>` | 486 |
| `<leader>ev` | N sil | `:e $MYVIMRC<CR>` | 488 |
| `<leader>sv` | N sil | `:so $MYVIMRC<CR>` | 489 |
| `,y` | N | `"+y` | 542 |
| `,y` | V | `"+y` | 543 |
| `,d` | V | `"+d` | 544 |
| `,p` | N | `"+p` | 546 |
| `,P` | N | `"+p` | 547 |
| `,p` | V | `"+p` | 548 |
| `,P` | V | `"+P` | 549 |
| `<leader><leader>T` |  | `:call Do_CsTag_Sys()<CR>` | 556 |
| `<leader>T` |  | `:call Do_CsTag()<CR>` | 577 |
| `fs` | N | `:lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>` | 600 |
| `<leader>z` | N | `:call Zoom()<CR>` | 616 |
| `f` |  | `:call ShowFuncName() <CR>` | 713 |
| `co` | N | `:copen<cr>` | 722 |
| `cj` | N | `:cnext<cr>` | 723 |
| `ck` | N | `:cprevious<cr>` | 724 |
| `cc` | N | `:cclose<cr>` | 725 |
| `ca` | N | `:cr<cr>` | 726 |
| `ce` | N | `:cla<cr>` | 727 |
| `lo` | N | `:lopen<cr>` | 730 |
| `lc` | N | `:lclose<cr>` | 731 |
| `lj` | N | `:lnext<cr>` | 733 |
| `lk` | N | `:lprevious<cr>` | 734 |
| `la` | N | `:lr<cr>` | 735 |
| `le` | N | `:lla<cr>` | 736 |
| `<2-LeftMouse>` |  | `<C-]>` | 739 |
| `<2-RightMouse>` |  | `<C-o>` | 740 |
| `<C-RightMouse>` |  | `<C-o>` | 741 |
| `<leader><LeftMouse>` |  | `<C-i>` | 742 |
| `oo` | N | `<C-o>` | 744 |
| `<leader>jf` | N | `:call B_JsonFormat()<cr>` | 754 |
| `hw` | N | `:let @/=expand('<cword>')<cr>` | 764 |
| `tu` |  | `:'<,'> s/_\(\w\)/\u\1/g<cr>:'<,'> s/^\(\w\)/\U\1/g<cr>` | 768 |
| `tU` |  | `:%s/\([^ .*+-]\)\([A-Z].\)/\1_\2/g<cr>ggguG` | 770 |
| `st` |  | `:call GetCurTmpFileFullPath()<CR>` | 775 |
| `<leader>so` | N | `:!open %<CR>` | 790 |

### 主插件配置（vimrc.bundles_base）

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `<leader>cd` | N | `:AutoChangeDirectory <cr>` | 159 |
| `<leader>i` |  | `:Nine2IndentGuides<cr>` | 166 |
| `<leader>,` |  | `:FixWhitespace<cr>` | 172 |
| `ek` | N sil | `<Plug>(ale_previous_wrap)` | 251 |
| `ej` | N sil | `<Plug>(ale_next_wrap)` | 252 |
| `eh` | N sil | `<Plug>(ale_first)` | 253 |
| `el` | N sil | `<Plug>(ale_last)` | 254 |
| `fh` |  | `<Plug>(easymotion-linebackward)` | 284 |
| `fw` |  | `<Plug>(easymotion-w)` | 285 |
| `fj` |  | `<Plug>(easymotion-e)` | 286 |
| `fk` |  | `<Plug>(easymotion-b)` | 287 |
| `fl` |  | `<Plug>(easymotion-lineforward)` | 288 |
| `<Leader><leader>.` |  | `<Plug>(easymotion-repeat)` | 292 |
| `mm` | N | `:BookmarkToggle<CR>` | 326 |
| `mi` | N | `:BookmarkAnnotate<CR>` | 327 |
| `mn` | N | `:BookmarkNext<CR>` | 328 |
| `mp` | N | `:BookmarkPrev<CR>` | 329 |
| `ma` | N | `:BookmarkShowAll<CR>` | 330 |
| `mc` | N | `:BookmarkClear<CR>` | 331 |
| `mx` | N | `:BookmarkClearAll<CR>` | 332 |
| `mkk` | N | `:BookmarkMoveUp` | 333 |
| `mjj` | N | `:BookmarkMoveDown` | 334 |
| `v` | V | `<Plug>(expand_region_expand)` | 353 |
| `V` | V | `<Plug>(expand_region_shrink)` | 354 |
| `<C-m>` | N | `MultiCursor next` *(via g:multi_cursor_next_key)* | 361 |
| `<C-p>` | N | `MultiCursor prev` *(via g:multi_cursor_prev_key)* | 362 |
| `<C-x>` | N | `MultiCursor skip` *(via g:multi_cursor_skip_key)* | 363 |
| `<leader>f` | N | `Leaderf <CR>` *(via g:Lf_ShortcutF)* | 383 |
| `<leader>b` | N | `Leaderf buffer<CR>` *(via g:Lf_ShortcutB)* | 384 |
| `gd` | N | `:<C-U>Leaderf gtags --auto-jump=1 -d <C-R><C-W><CR>` | 411 |
| `gr` | N | `:<C-U>Leaderf gtags --auto-jump=1 -r <C-R><C-W><CR>` | 413 |
| `gs` | N | `:<C-U>Leaderf gtags --auto-jump=1 -s <C-R><C-W><CR>` | 415 |
| `go` | N | `:<C-U>Leaderf gtags --recall<CR>` | 417 |
| `<leader>\` |  | `:call CtrlsfViewMode()<cr>` | 494 |
| `\` | N | `<Plug>CtrlSFCwordPath<CR>` | 495 |
| `\\` | N | `:let g:ctrlsf_default_view_mode_last = g:ctrlsf_default_view_mode<CR> :let g:...` | 498 |
| `<F7>` | N | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | 500 |
| `sf` | N | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>[(,)]'<cr>` | 501 |
| `sp` | N | `:CtrlSF<CR>` | 502 |
| `<leader>aa` | N | `:CtrlSF -R '\W<c-r>=expand("<cword>")<cr>'<cr>` | 503 |
| `ag` | N | `:Ag -w <c-r>=expand("<cword>")<cr> \\| grep '<c-r>=expand("<cword>")<cr>('<cr>` | 511 |
| `<leader>ag` | N | `:Ag -w <c-r>=expand("<cword>")<cr><cr>` | 513 |
| `<leader>a` | N | `:Ag '` | 516 |
| `<Leader>n` | sil | `:NERDTreeFind<cr>` | 569 |
| `<Leader>nf` | sil | `:NERDTreeFind<cr>` | 592 |
| `<C-d>` | sil | `:vertical resize 30<cr>` *au FileType nerdtree* | 596 |
| `<C-l>` | sil | `:vertical resize +10<cr>` *au FileType nerdtree* | 597 |
| `<C-h>` | sil | `:vertical resize -10<cr>` *au FileType nerdtree* | 598 |
| `<Leader>n` |  | `<plug>NERDTreeTabsToggle<CR>` | 605 |
| `<leader>m` | N | `:TagbarToggle<CR>` | 621 |
| `<leader>lt` | N | `LocListToggle (ListToggle)` *(via g:lt_location...)* | 779 |
| `<leader>qt` | N | `QFixToggle (ListToggle)` *(via g:lt_quickfix...)* | 780 |
| `<leader>cq` | N sil | `:cclose<bar>lclose<bar>pclose<CR>` | 784 |
| `ga` | V | `<Plug>(EasyAlign)` | 787 |
| `ga` | N | `<Plug>(EasyAlign)` | 788 |
| `<Leader>r` | N | `<Plug>(quickrun)` | 804 |
| `<F10>` |  | `:QuickRun<CR>` | 805 |
| `uh` |  | `:CopyrightUpdate<cr>` | 827 |
| `<silent><expr>` | I | `( complete_parameter#pre_complete("()")` | 853 |
| `<c-j>` | S | `<Plug>(complete_parameter#goto_next_parameter)` | 854 |
| `<c-j>` | I | `<Plug>(complete_parameter#goto_next_parameter)` | 855 |
| `<c-k>` | S | `<Plug>(complete_parameter#goto_previous_parameter)` | 856 |
| `<c-k>` | I | `<Plug>(complete_parameter#goto_previous_parameter)` | 857 |
| `sj` | N | `:SplitjoinSplit<cr>` | 865 |
| `sk` | N | `:SplitjoinJoin<cr>` | 866 |
| `p` | N buf | `<plug>(qf-preview-open)` *autocmd FileType qf* | 884 |

### 补全相关（vimrc.bundles_complex）

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `<F8>` |  | `:Autoformat<CR>` | 24 |
| `<c-j>` | I | `UltiSnips JumpForward` *(via g:UltiSnipsJumpForwardTrigger)* | 46 |
| `<c-k>` | I | `UltiSnips JumpBackward` *(via g:UltiSnipsJumpBackwardTrigger)* | 47 |
| `<leader>ds` |  | `:Dash<cr>` | 60 |
| `<C-k><C-o>` | I | `<Plug>(github-complete-manual-completion)` | 69 |
| `<silent><expr>` | I | `<Tab> <SID>SmartTab()` | 94 |
| `<Leader>cp` | N | `:Copilot panel<CR>` | 109 |

### YouCompleteMe（vimrc.bundles_ycm）

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `ff` | N | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | 68 |
| `fi` | N | `:YcmCompleter GoToImplementation<CR>` | 69 |
| `<leader>fi` | N | `:YcmCompleter GoToImplementation<CR>` | 70 |
| `fr` | N | `:YcmCompleter GoToReferences<CR>` | 71 |
| `<leader>fr` | N | `:YcmCompleter GoToReferences<CR>` | 72 |
| `<C-]>` | N | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` | 76 |
| `<leader>e` | N | `:YcmDiags<CR>` | 77 |
| `<Space>` | N | `<plug>(YCMHover)` | 80 |

### 备用（vimrc.bundles_simple）

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `<F8>` |  | `:F8FormatFile<CR>` | 42 |

---

## 三、文件类型相关（buffer-local，仅在对应 filetype 生效）

### 文件类型：cpp

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `<Leader>ch` | N | `:AS<CR>` | 18 |
| `<Leader>sch` | N | `:A<CR>` | 20 |

### 文件类型：dependout

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `<Leader>t` | N sil | `<Plug>Translate` | 18 |
| `<Leader>t` | V sil | `<Plug>TranslateV` | 19 |
| `<Leader>w` | N sil | `<Plug>TranslateW` | 21 |
| `<Leader>w` | V sil | `<Plug>TranslateWV` | 22 |
| `<Leader>r` | N sil | `<Plug>TranslateR` | 24 |
| `<Leader>r` | V sil | `<Plug>TranslateRV` | 25 |
| `<Leader>x` | N sil | `<Plug>TranslateX` | 27 |

### 文件类型：git

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `gt` | N | `:GitGutterToggle<CR>` | 23 |
| `gp` | N | `:GitGutterPrevHunk<CR>` | 24 |
| `gn` | N | `:GitGutterNextHunk<CR>` | 25 |
| `gz` | N | `:GitGutterUndoHunk<CR>` | 28 |
| `gh` | N | `:call CustomGitGutterLineHights()<CR>` | 37 |
| `gb` | N | `:G blame<CR>` | 44 |
| `<leader>gst` | N | `:G status<CR>` | 46 |
| `g<space>` | N | `:GBrowse<CR>` | 50 |
| `<leader>ht` |  | `:GundoToggle<CR>` | 59 |
| `gm` |  | `:GitMessenger<CR>` | 67 |

### 文件类型：go

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `<leader>gi` | N | `:GoImports<CR>` | 38 |
| `<C-n>` | I | `<C-x><C-o>` | 80 |
| `<leader>s` | N buf sil | `:<C-u>call go#def#Jump("split")<CR>` | 85 |
| `<leader>v` | N buf sil | `:<C-u>call go#def#Jump("vsplit")<CR>` | 86 |
| `ff` | N | `:GoDef<CR>` | 89 |
| `<2-LeftMouse>` | N | `:GoDef<CR>` | 90 |
| `fi` | N | `:GoImplements<CR>` | 91 |
| `<F6>` | N | `:GoImplements<CR>:cfirst<CR>` | 92 |
| `fr` | N | `:GoReferrers<CR>` | 93 |
| `<F8>` | N | `:GoReferrers<CR>` | 95 |
| `fs` | N | `:GoFillStruct<cr>` | 97 |
| `<Leader>d` | N | `:GoDoc<cr>` | 100 |
| `wh` | N | `:GoSameIds<cr>` | 102 |
| `whc` | N | `:GoSameIdsClear<cr>` | 103 |
| `<leader>rn` |  | `:GoRename<cr>` | 104 |
| `ga` | N | `:GoAddTag json` | 107 |
| `gaj` | N | `:GoAddTag json<CR>` | 108 |
| `gas` | N | `:GoAddTag schema<CR>` | 109 |
| `gad` | N | `:GoAddTag db<CR>` | 110 |
| `grt` | N | `:GoRemoveTags db` | 111 |
| `grj` | N | `:GoRemoveTags json<CR>` | 112 |
| `grd` | N | `:GoRemoveTags db<CR>` | 113 |
| `<Leader>e` | N | `:GoBuild<cr>` | 116 |
| `<Leader>gb` | N | `:GoBuild<cr>` | 117 |
| `cl` | N | `:GoMetaLinter<cr>` | 118 |
| `<F10>` | N | `:GoMetaLinter<CR>` | 119 |
| `ek` | N sil | `:cprevious<cr>` | 120 |
| `ej` | N sil | `:cnext<cr>` | 121 |
| `eh` | N sil | `:cr<cr>` | 122 |
| `el` | N sil | `:cla<cr>` | 123 |
| `<Leader>tt` | N | `:call Nine2GoTest()<cr>` | 125 |
| `<Leader>tb` | N | `:call Nine2GoBench()<cr>` | 126 |
| `<Leader>tf` | N | `:call Nine2GoTestFunc()<cr>` | 127 |
| `<F9>` | N | `:call Nine2GoTestFunc()<CR>` | 128 |
| `<leader><F9>` | N | `:call Nine2GoBenchmarkFunc()<CR>` | 129 |
| `<leader>bb` |  | `:DlvAddBreakpoint<cr>` | 214 |
| `<leader>ba` |  | `:DlvToggleTracepoint<cr>` | 215 |
| `<leader>br` |  | `:DlvRemoveBreakpoint<cr>` | 216 |
| `<leader>bc` |  | `:DlvClearAll<cr>` | 218 |
| `<leader>bd` |  | `:DlvDebug<cr>` | 220 |
| `<leader>gt` |  | `:GoTests<cr>` | 228 |

### 文件类型：leetcode

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `<leader>ll` | N | `:LeetCodeList<cr>` | 17 |
| `<leader>lt` | N | `:LeetCodeTest<cr>` | 18 |
| `<leader>ls` | N | `:LeetCodeSubmit<cr>` | 19 |
| `<leader>li` | N | `:LeetCodeSignIn<cr>` | 20 |

### 文件类型：quickui

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `<space><F2>` |  | `:call quickui#menu#open()<cr>` | 60 |

### 文件类型：uml

| 按键 | 模式 | 命令 | 行号 |
|------|:----:|------|------|
| `<F10>` | N | `:w<CR> :PlantumlOpenSVG<CR>` | 28 |
| `<F10>` | I | `<Esc>:w<CR> :PlantumlOpenSVG<CR>` | 29 |

---

## 维护

本表由 `tools/scan_keys.py`（如有）或手动 grep 生成；新增/修改快捷键时请重新生成本表。

生成命令（参考）：
```bash
python3 /tmp/gen_keys_md.py
```

**最后更新**: 2026-05-08