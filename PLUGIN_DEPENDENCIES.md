# Vim 插件依赖配置表

本仓库所有 vim 插件的**外部系统依赖**清单与安装命令。
**仅收录有外部依赖的插件**；纯 Vimscript / 无依赖的插件不在本表中。

> **环境**：macOS + zsh + Homebrew 为基线。Linux 用户请将 `brew install` 替换为对应包管理器命令。
> **维护**：新增/删除插件时请同步更新本表。

---

## TL;DR — 一键装齐（推荐顺序）

```bash
# === 1. 编译/索引基础工具 ===
brew install cmake python@3 node go rust universal-ctags

# === 2. 搜索引擎 ===
brew install ripgrep the_silver_searcher

# === 3. Gtags 跨语言索引（LeaderF Gtags 集成）===
brew install global pygments

# === 4. 格式化器 ===
brew install clang-format shfmt

# === 5. Go 开发工具链 ===
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/cweill/gotests/gotests@latest
go install github.com/jstemmer/gotags@latest          # vim-go tagbar 子配置（当前 disabled）
go install github.com/go-delve/delve/cmd/dlv@latest

# === 6. Python 工具链（ALE fixers / linters）===
pip3 install autopep8 isort flake8 pycodestyle pyflakes pygments

# === 7. macOS 应用（dash.vim 用）===
# 从 https://kapeli.com/dash 下载 Dash（或 brew install --cask dash）

# === 8. 字体（vim-airline 状态栏图标显示）===
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
# 然后把终端字体改成 "MesloLGS Nerd Font" 或类似 Nerd Font

# === 9. plantuml-previewer.vim ===
brew install plantuml openjdk            # 需要 Java 运行 plantuml.jar

# === 10. YouCompleteMe 编译（首次或更新后）===
cd ~/mydotfiles/b-dotfiles/b-vim/.vim/bundle/YouCompleteMe
python3 install.py --all                  # 一次编译所有语义引擎（C++/Go/Rust/JS/Python）
# 或按需：python3 install.py --go-completer --ts-completer
```

---

## 1. 索引与代码导航

### LeaderF Gtags 集成

**配置位置**：`config/vimrc.bundles_base`（`g:Lf_Gtagslabel = 'native-pygments'` 等）

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `global` (gtags) | 主索引引擎 | `brew install global` |
| `pygments` | 扩展到 30+ 语言（Go/Python/JS/Rust 等） | `brew install pygments` |
| `ripgrep` | LeaderF 文件搜索后端（`g:Lf_DefaultExternalTool = 'rg'`） | `brew install ripgrep` |

**首次使用**：进入项目自动建索引（5-30 秒，看仓库大小）；之后增量更新；索引存 `~/.LfCache/` 不污染项目。

### tagbar / TagHighlight

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `universal-ctags` | tags 文件生成（**注意**：不是 macOS 自带的 `ctags`，那个老旧） | `brew install universal-ctags` |

> TagHighlight 当前已通过 `g:loaded_TagHighlight = 1` 禁用；tagbar 主插件保留但 vim-go 的 tagbar 子配置已 disable。

---

## 2. 补全与 LSP

### YouCompleteMe (YCM)

**关键**：每次更新或首次安装后必须**重新编译**。

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `cmake` | 编译 ycmd C++ 部分 | `brew install cmake` |
| `python3` | ycmd 运行时（vim 也需 +python3） | `brew install python@3` |
| `go` | 启用 Go 补全 | `brew install go` |
| `rust` | 启用 Rust 补全 | `brew install rust` |
| `node` | 启用 JS/TS 补全 | `brew install node` |

**编译命令**：
```bash
cd ~/mydotfiles/b-dotfiles/b-vim/.vim/bundle/YouCompleteMe
python3 install.py --all                  # 一次编译所有语言
# 或最小化：python3 install.py --go-completer
```

> 配置目录 `bundle/ycm_simple_conf/` 是 `.ycm_extra_conf.py` 模板，无需额外安装。

### ai-complete（自研，替代已被组织禁用的 Copilot）

| 依赖 | 用途 | 获取方式 |
|---|---|---|
| `curl` | 异步调用 ModelScope API-Inference | macOS 自带 |
| `$MODELSCOPE_API_KEY` 环境变量 | ModelScope 鉴权（国内直连，免费额度 2000 次/天） | [modelscope.cn](https://www.modelscope.cn) 绑定阿里云账号后，个人中心 → 访问控制 → 访问令牌 生成 |

> 设计文档：`docs/superpowers/specs/2026-08-05-vim-gemini-completion-design.md`（本仓库内，untracked，仅本地参考；文档名沿用最初评估 Gemini 时所起，实际后端已迭代为 ModelScope + Qwen3-Coder，过程见文档内 Gemini/Claude/GLM 候选评估记录）。

### ultisnips + vim-snippets

| 依赖 | 用途 | 备注 |
|---|---|---|
| vim 编译时启用 `+python3` | Snippets 引擎 | `vim --version \| grep -E '\+python3'` 验证；macOS Homebrew vim 默认带 |

### CompleteParameter.vim

| 依赖 | 用途 | 备注 |
|---|---|---|
| vim `+python3` | 函数签名解析 | 同上 |

---

## 3. Lint 与格式化（ALE 全家桶）

ALE 本身是纯 Vimscript，但每个 linter / fixer 都是独立 binary。

### Go

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `golangci-lint` | ALE 主 lint（`g:ale_linters = {'go': ['golangci-lint']}`） | `go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest` |
| `goimports` | ALE fixer（保存时整理 import） | `go install golang.org/x/tools/cmd/goimports@latest` |
| `gofmt` | go 自带，免装 | — |

### Python

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `autopep8` | ALE fixer（保存时格式化） | `pip3 install autopep8` |
| `isort` | ALE fixer（整理 import） | `pip3 install isort` |
| `flake8` | ALE linter | `pip3 install flake8` |
| `pycodestyle` (pep8) | ALE linter | `pip3 install pycodestyle` |
| `pyflakes` | ALE linter（备选） | `pip3 install pyflakes` |

### vim-clang-format（C/C++）

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `clang-format` | 通过 `:F8FormatFile` 调用（vimrc.bundles_simple） | `brew install clang-format` |

### vim-shfmt（Shell）

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `shfmt` | 通过 `:F8FormatFile` 调用（filetype=sh） | `brew install shfmt` |

### vim-autoformat

| 依赖 | 用途 | 备注 |
|---|---|---|
| 各 filetype 对应的 formatter | `<F8>` 触发 | 视使用的 filetype 而定（prettier/clang-format/black/...）|

---

## 4. Go 开发（vim-go + 周边）

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `go` | 主工具链（`g:go_def_mode = 'gopls'`） | `brew install go` |
| `gopls` | LSP 服务器 | `go install golang.org/x/tools/gopls@latest` |
| `gotests` | gotests-vim 用（`<leader>gt`） | `go install github.com/cweill/gotests/gotests@latest` |
| `dlv` | vim-delve 调试器 | `go install github.com/go-delve/delve/cmd/dlv@latest` |
| `gotags` | vim-go tagbar 子配置（**当前 disabled**，需要时再装） | `go install github.com/jstemmer/gotags@latest` |
| `golint` | golint-fixer.vim（已被 golangci-lint 替代） | 可不装 |

> 配置文件 `config/filetype_bundles/go.vim` 已关闭 vim-go 的 fmt/imports autosave，由 ALE fixers 异步处理。

---

## 5. Java 开发

### vim-javacomplete2

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| Java 8+ JDK | 编译 vim-javacomplete2 的 .java 解析器 | `brew install openjdk` |
| Maven 或 Gradle | 项目依赖解析（如果用 build tool） | `brew install maven` 或 `brew install gradle` |

**首次安装**：
```bash
cd ~/mydotfiles/b-dotfiles/b-vim/.vim/bundle/vim-javacomplete2
mvn package    # 或 ./gradlew
```

---

## 6. 搜索

### ag.vim

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `the_silver_searcher` (ag) | `:Ag`、`<leader>a`、`<leader>ag` | `brew install the_silver_searcher` |

### ctrlsf.vim

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `ag` 或 `rg` 或 `ack` | 搜索后端（按可用性自动选） | 装任一即可（推荐 `brew install ripgrep`）|

---

## 7. Git 集成

> 系统装 `git` 即满足这组所有插件的基础需求（macOS Xcode CLT 自带）。

| 插件 | 额外依赖 | 备注 |
|---|---|---|
| vim-fugitive | `git` | `:Git`/`:Gdiff`/`:Gblame` |
| vim-rhubarb | `git` + GitHub repo | `:GBrowse` 在浏览器打开 GitHub 页 |
| vim-fubitive | `git` + Bitbucket repo | 同 rhubarb 但支持 Bitbucket |
| gv.vim | `git` + vim-fugitive | git 历史浏览 |
| nerdtree-git-plugin | `git` | NERDTree 中的 git 状态标记 |
| vim-rooter | `git` | 自动 cd 到 git 根目录 |

---

## 8. UML / 文档

### plantuml-previewer.vim

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| `Java` | 运行 plantuml.jar | `brew install openjdk` |
| `plantuml` | UML 渲染器 | `brew install plantuml` |
| 浏览器 | 预览（用系统默认） | macOS 自带 |
| open-browser.vim | 触发浏览器（已装） | — |

---

## 9. macOS 特定

### dash.vim

| 依赖 | 用途 | 安装命令 |
|---|---|---|
| Dash app | 触发 `<leader>ds` 查文档 | 从 https://kapeli.com/dash 下载，或 `brew install --cask dash` |

> 仅 macOS 生效；Linux/Windows 上不工作（可忽略此插件）。

---

## 10. 翻译

### vim-translator

| 依赖 | 用途 | 备注 |
|---|---|---|
| `python3` | 调用翻译 API | vim 已带 |
| 网络 | 调用 Google Translate / Bing Translate | 可能需要代理（中国大陆）|

---

## 11. 字体（vim-airline 显示图标）

`vim-airline` 配置中已使用 powerline 风格分隔符（``、``）。这些字符**只能在 powerline 字体或 nerd font 中正确显示**。

| 字体 | 用途 | 安装命令 |
|---|---|---|
| Nerd Font (推荐 MesloLGS / Hack / Fira Code) | airline 状态栏分隔符 + nerdtree-git 图标 | `brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font` |

**安装后**：在终端（iTerm2 / Alacritty / WezTerm 等）的 Profile 设置中将字体改为 "MesloLGS Nerd Font"。

---

## 12. 终端外 vim 工具

### vimproc.vim / vimshell.vim

| 依赖 | 用途 | 备注 |
|---|---|---|
| `make` + C 编译器 | 编译 vimproc 的 .so 异步 IO 模块 | macOS：`xcode-select --install` 提供 |

**首次安装**：
```bash
cd ~/mydotfiles/b-dotfiles/b-vim/.vim/bundle/vimproc.vim
make
```

---

## 13. 完全无外部依赖的插件（仅供参考，不需配置）

以下插件是**纯 Vimscript / 仅依赖 vim 自身**，无需任何额外安装：

```
a.vim · Colorizer · delimitMate · echodoc.vim · gundo.vim · ListToggle ·
molokai · nerdcommenter · nerdtree · nerdtree-git-plugin · nginx.vim ·
open-browser.vim · plantuml-syntax · python-syntax · python.vim ·
rainbow_parentheses.vim · splitjoin.vim · STL-Syntax · tagbar-markdown ·
vim-airline · vim-airline-themes · vim-bookmarks · vim-copyright ·
vim-custom-syntax · vim-easy-align · vim-easymotion · vim-expand-region ·
vim-indent-guides · vim-markdown · vim-markdown-quote-syntax ·
vim-markdown-toc · vim-multiple-cursors · vim-nerdtree-tabs · vim-protobuf ·
vim-qf-preview · vim-quickrun · vim-rooter · vim-smoothie · vim-table-mode ·
vim-trailing-whitespace · vim-xml-runtime · vim-yaml · vimcdoc · xml.vim ·
xterm-color-table.vim
```

> `vim-quickrun` 在使用具体语言运行时，需要对应语言的 binary（python/go/...），但仅作为运行时依赖，不算插件依赖。

---

## 验证清单（一次性自检）

```bash
# 关键依赖是否齐全
echo "=== 索引/搜索 ===";   command -v global gtags rg ag ctags pygmentize 2>/dev/null
echo "=== 编译工具 ===";    command -v cmake python3 node go 2>/dev/null
echo "=== Go 工具 ===";     command -v gopls goimports golangci-lint gotests dlv gotags 2>/dev/null
echo "=== 格式化 ===";      command -v clang-format shfmt 2>/dev/null
echo "=== Python ===";      python3 -c "import autopep8, isort, flake8, pygments" 2>&1
echo "=== Java ===";        command -v java mvn 2>/dev/null
echo "=== UML ===";         command -v plantuml 2>/dev/null
echo "=== Vim 编译 ===";    vim --version | grep -oE '\+python3|\+lua|\+ruby' | head -3
```

---

## 维护守则

新增插件时：
1. 评估外部依赖（如有 → 加入本表对应章节）
2. 在 `vimrc.bundles_*` 的 `Plug 'foo/bar'` 上方注释中**简短标注依赖**（如 `" 依赖：brew install xxx`）
3. 更新本表 TL;DR 段的"一键装齐"命令

删除插件时（按 `bundle.archive/` 流程）：
1. 检查依赖是否可一并清理（其他插件不再使用）
2. 从本表中删除对应条目

---

**最后更新**: 2026-05-08
**当前 bundle/ 总数**: 82
**有外部依赖的插件**: ~30 个（其余 ~50 个为纯 Vimscript）
