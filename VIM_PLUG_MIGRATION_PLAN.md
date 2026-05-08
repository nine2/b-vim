# Vundle → vim-plug 迁移方案

> **状态**: 计划阶段（pending review）
> **作者**: tianlong + Claude
> **日期**: 2026-05-08
> **关联**: review md `Ch.11.A`、commit `6055524 [Ch.11] defer vim-plug migration`

---

## 1. 为什么要迁移

| 维度 | Vundle（当前） | vim-plug（目标） |
|---|---|---|
| 维护状态 | 8+ 年未更新 | 活跃 |
| 懒加载 | 仅 `for: filetype`，且即 source 即装 | `for / on / cmd` 真懒加载，启动时**完全不 source** |
| 并行安装 | 串行 | 并行（默认 16 个 job） |
| 命令体验 | `:BundleInstall` | `:PlugInstall` 带进度 UI |
| 启动开销 | 每个 Bundle 都要 source（即使不用） | 懒加载的不 source |
| 预估收益 | — | 启动 1.7s → **<1.0s**（懒加载冷门 filetype 后） |

---

## 2. 现状盘点（实测数据）

### 2.1 Bundle 声明数量
| 文件 | 声明数 |
|---|---:|
| `config/vimrc.bundles_base` | 34 |
| `config/filetype_bundles/*.vim` | 36 |
| `config/vimrc.bundles_complex` | 7 |
| `config/vimrc.bundles_ycm` | 2 |
| `config/vimrc.bundles_simple` | 2 |
| **合计** | **81** |

### 2.2 Bundle 用法
- **带选项的只有 1 个**：`Bundle 'z0mbix/vim-shfmt', { 'for': 'sh' }`（vim-plug 同语法兼容）
- 单引号 / 双引号混用（vim-plug 都支持）
- 无 git URL 形式（全是 `user/repo` 短名）

### 2.3 软链插件（高风险，必须特殊处理）
```
~/.vim/bundle/YouCompleteMe       → YouCompleteMe.251216 （实体目录）
~/.vim/bundle/vim-go              → vim-go.250925       （实体目录）
```
> vim-plug 的 `:PlugClean` 会删除"不在 Plug 列表里的目录"——若软链或目标目录不被纳入 Plug 管理会被误删。

### 2.4 归档目录（不能被误删）
```
~/.vim/bundle.archive/    35 个旧插件
~/.vim/vimrc.archive/      6 个 config 文件残片
```

### 2.5 当前加载链
```
~/.vimrc → b-dotfiles/b-vim/config/vimrc
        → vimrc.bundles_base
            ├── set rtp+= $VIM_TMP_PATH/bundle/vundle/      # vundle 自身
            ├── call vundle#rc("$VIM_TMP_PATH/bundle")      # bundle 目录
            ├── 34 × Bundle 'foo/bar'
            ├── source vimrc.bundles_filetype  → 36 × Bundle (filetype 配置)
            └── source $VIM_TMP_PATH/vimrc.bundles
                → 软链 vimrc.bundles_complex
                    └── 7 × Bundle
                    └── source vimrc.bundles_completion
                        → 软链 vimrc.bundles_ycm
                            └── 2 × Bundle (YCM)
```

---

## 3. 迁移设计

### 3.1 目录策略

**保持 `bundle/` 路径**（兼容现有软链 + bundle.archive/ 不动）：

```vim
" 改前 (vundle)
set rtp+=$VIM_TMP_PATH/bundle/vundle/
call vundle#rc("$VIM_TMP_PATH/bundle")
" Bundle 声明...
filetype plugin indent on

" 改后 (vim-plug)
call plug#begin($VIM_TMP_PATH . '/bundle')
" Plug 声明...
call plug#end()    " 内含 filetype plugin indent on
```

> `plug#begin()` 接受任意目录，**不强制改名为 `plugged/`**。复用 `bundle/` 让现有软链、归档目录都不受影响。

### 3.2 软链处理（关键）

**不通过 vim-plug 管理 YCM 和 vim-go**，避免 `:PlugClean` 误删：

```vim
" 在 plug#end() 之后手动 set rtp+=（vim-plug 不会动这些目录）
set rtp+=$VIM_TMP_PATH/bundle/YouCompleteMe
set rtp+=$VIM_TMP_PATH/bundle/vim-go
```

**但** ftplugin/syntax 依然能加载，因为 vim 启动时所有 rtp 下的 plugin/*.vim、ftdetect/*.vim 都会扫描。

### 3.3 防 `:PlugClean` 误删

vim-plug 在 `g:plugs` 中维护"已声明的插件"白名单，`:PlugClean` 删除目录中的其余项。**`bundle.archive/` 在 `bundle/` 平级（不是子目录），不受影响**。

但 `bundle/` 内的非 Plug 项会被删（`vundle/` 自身、`YouCompleteMe`、`vim-go`、`ycm_simple_conf`）。

**保护方法**：
```vim
let g:plug_clean_skip = ['YouCompleteMe', 'YouCompleteMe.251216',
                       \ 'vim-go', 'vim-go.250925',
                       \ 'ycm_simple_conf', 'vundle']
```
（vim-plug 实际没这个变量，需通过 `g:plug_threads` 配置或不跑 `:PlugClean` 兜底）

**保险做法**：约定**永远不跑 `:PlugClean`**，手动删除即可。

### 3.4 懒加载策略

按使用频率分类，**保守不全用懒加载**（避免引入 bug）：

| 类别 | 现有插件举例 | 懒加载策略 |
|---|---|---|
| 启动必加载 | airline、molokai、nerdtree、ALE、LeaderF、smoothie、rooter、bookmarks | 不懒加载 |
| filetype-specific | vim-go（去软链后）、vim-markdown、vim-protobuf、nginx.vim、xml.vim、vim-yaml | `Plug 'foo', { 'for': 'go' }` |
| 命令触发 | gundo.vim、vim-delve、tagbar、splitjoin、vim-translator、Colorizer、xterm-color-table | `Plug 'foo', { 'on': '<Cmd>' }` |
| 视觉/编辑 | delimitMate、easymotion、easy-align、multiple-cursors、expand-region | 不懒加载（按键随时可触发） |

### 3.5 命令变化

| 操作 | Vundle | vim-plug |
|---|---|---|
| 安装新插件 | `:BundleInstall` | `:PlugInstall` |
| 更新 | `:BundleInstall!` | `:PlugUpdate` |
| 清理 | `:BundleClean` | `:PlugClean`（**禁用**，保护软链） |
| 列出 | `:BundleList` | `:PlugStatus` |

---

## 4. 影响评估

### 4.1 高风险点

| # | 风险 | 概率 | 影响 | 缓解 |
|---|---|---|---|---|
| 1 | YCM/vim-go 软链被 `:PlugClean` 删除 | 高（如果跑了清理）| 致命（YCM 编译重建 ~10min） | 不跑 PlugClean，软链不纳 Plug 管理 |
| 2 | filetype 加载顺序差异（懒加载 ftplugin 不及时） | 中 | 用户开 .go 文件功能缺失 | 先不开懒加载，验证完再加 |
| 3 | `Bundle 'foo'` 双引号语法迁移漏掉 | 低 | 启动报错 | sed 替换 + grep 验证 |
| 4 | vundle init 残留导致冲突 | 中 | 启动慢或报错 | 完全替换初始化代码 |
| 5 | Bundle 选项语法（`{'for':'sh'}`）不兼容 | 极低 | 单插件失效 | vim-plug 已兼容此语法 |

### 4.2 兼容性

| 项 | vim-plug 支持 | 备注 |
|---|---|---|
| `Plug 'user/repo'` | ✅ | |
| `Plug "user/repo"` 双引号 | ✅ | |
| `Plug 'foo', { 'for': 'sh' }` | ✅ | 对应 vundle 现有用法 |
| Git URL `Plug 'git@github.com:...'` | ✅ | |
| 本地路径 `Plug '~/path'` | ✅ | |
| commit/tag/branch 锁定 | ✅（vundle 不支持） | 后续可加 |

### 4.3 现有功能验证清单（迁移后必跑）

- [ ] vim 启动 < 2s（`vim --startuptime`）
- [ ] go 文件：YCM 补全、`gd` 跳定义、`:GoBuild`、ALE lint、`gn/gp` hunk 跳转
- [ ] python 文件：补全、ALE flake8、autopep8 fix
- [ ] markdown：vim-markdown 高亮、:GenTocGFM、tagbar
- [ ] git：fugitive `:G blame`、gitgutter sign、gv.vim 历史
- [ ] 搜索：`<leader>f`(LeaderF)、`<leader>aa`(CtrlSF)
- [ ] gtags：`gd/gr/gs/go` 全部工作
- [ ] LeaderF Gtags `:w` 保存时自动更新索引
- [ ] copilot：`<Tab>` 接受补全
- [ ] ultisnips：`<C-l>` 展开 / `<C-j>` 跳转
- [ ] Color：airline 状态栏 powerline 字符正常
- [ ] 关键 buffer 操作：NERDTree toggle、tab 切换
- [ ] `:w` 触发 ALE 异步 fix（go imports / autopep8）
- [ ] 主代码 buffer 中 `<leader>cq` 关闭辅助窗口
- [ ] 整个交互流：编辑、保存、跳转、搜索、git diff、关闭

---

## 5. 分阶段执行计划

> **每阶段结束都 commit**，方便回滚。整个迁移在 `refactor/vim-plug-migration` 子分支进行。

### 阶段 1：准备（无副作用）
1. 创建子分支 `refactor/vim-plug-migration`（基于 `refactor/vim-perf-and-plugin-cleanup`）
2. 安装 vim-plug：
   ```bash
   curl -fLo ~/mydotfiles/b-dotfiles/b-vim/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```
3. 写迁移工具脚本 `tools/migrate_to_vim_plug.py`：
   - 读取 6 个 config 文件
   - 替换 `Bundle ` → `Plug `（保留所有选项和注释）
   - 替换 vundle init 段落 → plug#begin/end
   - 干跑（dry-run）输出 diff，人工 review
4. **commit**: "chore(vim): install vim-plug + migration tool"

### 阶段 2：核心迁移（vimrc.bundles_base）
1. 备份原文件到 `.vim/vimrc.archive/`
2. 替换 vundle init 段（line 26-27 + 末尾 filetype）：
   ```vim
   call plug#begin($VIM_TMP_PATH . '/bundle')
   " ... 34 个 Plug ...
   " 软链特例（不纳入 Plug 管理）
   call plug#end()
   set rtp+=$VIM_TMP_PATH/bundle/YouCompleteMe
   set rtp+=$VIM_TMP_PATH/bundle/vim-go
   set rtp+=$VIM_TMP_PATH/bundle/ycm_simple_conf
   ```
3. 跑迁移工具替换全部 `Bundle ` → `Plug `
4. 启动 vim，看是否报错（不跑 :PlugInstall，因为 bundle/ 已有所有插件）
5. 跑回归测试清单（章节 4.3）
6. **commit**: "refactor(vim): migrate vimrc.bundles_base from Vundle to vim-plug"

### 阶段 3：迁移 filetype_bundles/*.vim（36 个 Bundle）
1. 跑迁移工具替换
2. 启动 vim 打开 .go / .py / .md 文件，验证 filetype 配置加载
3. **commit**: "refactor(vim): migrate filetype_bundles to vim-plug"

### 阶段 4：迁移 vimrc.bundles_complex / ycm / simple（11 个 Bundle）
1. 跑迁移工具替换
2. 验证 ultisnips、copilot、autoformat、YCM 加载
3. **commit**: "refactor(vim): migrate complex/ycm/simple bundle files"

### 阶段 5：删除 vundle 自身（清理）
1. `mv ~/.vim/bundle/vundle ~/.vim/bundle.archive/`
2. 移除 vimrc.bundles_base 顶部的 `set rtp+=...vundle/` 那行（如还有残留）
3. **commit**: "chore(vim): remove vundle (replaced by vim-plug)"

### 阶段 6：懒加载优化（可选，按收益评估）
1. 给 vim-delve / tagbar / Colorizer 等加 `{ 'on': '<Cmd>' }`
2. 给 nginx.vim / vim-protobuf / vim-yaml 等加 `{ 'for': 'xxx' }`
3. 跑 startuptime 对比
4. **commit**: "perf(vim): add lazy-loading hints to non-critical plugins"

### 阶段 7：文档更新
1. README.md 更新：把 `Bundle` 命令说明改成 `Plug`
2. PLUGIN_DEPENDENCIES.md 更新：`:BundleInstall` → `:PlugInstall`
3. SHORTCUTS.md（脚本自动生成无需改）
4. **commit**: "docs(vim): update docs for vim-plug migration"

### 阶段 8：合并主分支
1. 跑完整回归（章节 4.3 全部勾选）
2. 性能基准对比 startup time
3. 合并 `refactor/vim-plug-migration` → `refactor/vim-perf-and-plugin-cleanup`
4. push 远程

---

## 6. 工作量估算

| 阶段 | 内容 | 估时 |
|---|---|---|
| 1 | 准备 + 写迁移工具 | 30 min |
| 2 | bundles_base 迁移 + 测试 | 30 min |
| 3 | filetype_bundles 迁移 | 20 min |
| 4 | complex/ycm/simple 迁移 | 15 min |
| 5 | 清理 vundle | 5 min |
| 6 | 懒加载（可选）| 30 min |
| 7 | 文档 | 15 min |
| 8 | 合并 + 回归 | 30 min |
| **合计** | | **~3 小时** |

---

## 7. 回滚方案

每阶段都有 commit，任何阶段失败都可：
```bash
cd ~/mydotfiles/b-dotfiles/b-vim
git checkout refactor/vim-perf-and-plugin-cleanup    # 回到迁移前
# 或
git revert <bad-commit>                              # 回滚单一阶段
```

如果 `bundle/` 被误清理：
```bash
mv .vim/bundle.archive/<plugin> .vim/bundle/
```

如果 YCM 软链断裂：
```bash
cd .vim/bundle
ln -sf YouCompleteMe.251216 YouCompleteMe
```

---

## 8. 决策点（待确认）

1. **是否启用懒加载？**
   - 启用：启动可能 < 1s，但可能引入边界 case bug
   - 不启用：保守迁移，启动 ~1.5s
   - **推荐**：阶段 1-5 不启用，单独阶段 6 评估

2. **`:PlugClean` 用还是不用？**
   - 用：方便清理；但软链有风险
   - 不用：手动 mv 到 archive；安全
   - **推荐**：不用；手动 mv

3. **vundle 自身留不留？**
   - 留：作为 fallback（vimrc.bundles_simple 还能跑）
   - 不留：彻底干净
   - **推荐**：迁移完后归档（mv 到 bundle.archive/，不删）

4. **vim-plug 安装位置？**
   - `~/.vim/autoload/plug.vim`（标准）— 但 `~/.vim` 当前无内容
   - `~/mydotfiles/b-dotfiles/b-vim/.vim/autoload/plug.vim`（跟项目同目录）— 跟 VIM_TMP_PATH 一致
   - **推荐**：后者，跟 vundle 当前位置一致

---

## 9. 备选方案（如果不想完全迁）

**渐进迁移**：在 vundle 之外**额外**用 vim-plug 管理新增的插件。两套并存：
- vundle 管旧的 81 个
- vim-plug 管以后新增的

不推荐——长期维护两套配置反而麻烦。

---

## 10. 下一步

确认本计划后，按"阶段 1"开始执行。

**等待**：
- [ ] 是否启用懒加载？（阶段 6 是否做）
- [ ] vim-plug 安装位置确认
- [ ] 是否在阶段 5 删除 vundle（还是仅归档）
- [ ] 是否需要先跑一个最小 PoC（仅迁移 1 个文件验证流程）

收到确认后开始执行。
