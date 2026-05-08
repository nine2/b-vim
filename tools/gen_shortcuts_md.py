#!/usr/bin/env python3
"""扫描 vim 配置生成快捷键 md 文档。"""
import os, re
from pathlib import Path
from collections import defaultdict, OrderedDict

CONFIG_DIR = Path.home() / "mydotfiles/b-dotfiles/b-vim/config"
OUT_FILE = Path.home() / "mydotfiles/b-dotfiles/b-vim/SHORTCUTS.md"

MODE_NAMES = {
    '': 'all', 'n': 'normal', 'nn': 'normal',
    'i': 'insert', 'in': 'insert',
    'v': 'visual', 'vn': 'visual',
    's': 'select', 'x': 'visual-only',
    'c': 'cmdline', 't': 'terminal',
}

def parse_map_line(line):
    s = line.lstrip()
    if s.startswith('"'):
        return None
    au_prefix = ''
    m_au = re.match(r'^(au\w*\s+\S+(?:\s+\S+)*?)\s+((?:n|nn|i|in|v|vn|s|x|c|t)?(?:no)?(?:re)?map\b)', s)
    if m_au:
        au_prefix = m_au.group(1).strip()
        rest = s[m_au.end(1):].strip()
    else:
        rest = s
    m = re.match(
        r'^((?:n|nn|i|in|v|vn|s|x|c|t)?)(?:no)?(?:re)?map'
        r'((?:\s+<silent>|\s+<buffer>|\s+<expr>|\s+<unique>|\s+<nowait>)*)'
        r'\s+(\S+)\s+(.+)$',
        rest
    )
    if not m:
        return None
    mode = m.group(1) or ''
    opts = m.group(2).strip()
    lhs = m.group(3)
    rhs = m.group(4).rstrip()
    # 去除尾部 inline 注释
    rhs = re.sub(r'\s+"[^"]*$', '', rhs)
    return (au_prefix, mode, opts, lhs, rhs)

def normalize_lhs(lhs):
    """规范 LHS 表达，提取排序键。"""
    # 先把 <leader>/<Leader> 替换为 ␣ 占位
    lhs_lower = lhs.lower()
    # 提取排序键
    # 1. 如果以 <leader> 开头，取后面的字符
    m = re.match(r'^<leader>(.+)$', lhs_lower)
    if m:
        sort_key = m.group(1)
    else:
        sort_key = lhs_lower
    # 提取第一个有意义字符
    # 处理 <F8>/<C-x>/<S-x>/<Esc> 等
    m = re.match(r'^<f(\d+)>$', sort_key)
    if m:
        return ('zfn', int(m.group(1)), lhs)  # F 键放最后
    m = re.match(r'^<c-(.)>$', sort_key)
    if m:
        return ('zctrl', m.group(1), lhs)
    if sort_key.startswith('<'):
        return ('zsp', sort_key, lhs)
    # 普通字符
    return ('a', sort_key, lhs)

# 命令字典：RHS 主命令 → 说明
CMD_DESC = {
    # NERDTree / 文件树
    ':NERDTreeToggle': '切换文件树侧边栏',
    ':NERDTreeFind': '在文件树中定位当前文件',
    # vim-go
    ':GoBuild': 'Go 编译当前包',
    ':GoTest': '运行 Go 测试',
    ':GoTestFunc': '运行光标下的测试函数',
    ':GoDef': '跳到定义（gopls）',
    ':GoDoc': '查看文档',
    ':GoReferrers': '找所有引用（gopls）',
    ':GoImplements': '找接口实现',
    ':GoRename': '重命名符号',
    ':GoFillStruct': '自动填充 struct 字段',
    ':GoImports': '整理 import',
    ':GoMetaLinter': '运行 Go metalinter',
    ':GoInfo': '显示 Go 类型信息',
    ':GoFmt': '格式化（gofmt）',
    ':GoSameIds': '高亮当前作用域同名标识符',
    ':GoSameIdsClear': '清除同名高亮',
    ':GoAddTag': '为 struct 字段添加 tag',
    ':GoRemoveTags': '移除 struct tag',
    # GitGutter
    ':GitGutterToggle': '切换 hunk 标记列',
    ':GitGutterNextHunk': '跳到下一个变更 hunk',
    ':GitGutterPrevHunk': '跳到上一个变更 hunk',
    ':GitGutterUndoHunk': '撤销当前 hunk',
    ':GitGutterStageHunk': '暂存当前 hunk',
    ':GitGutterPreviewHunk': '预览 hunk diff',
    ':GitGutterLineHighlightsDisable': '关闭行高亮',
    ':GitGutterLineHighlightsEnable': '开启行高亮',
    # CtrlSF / 搜索
    ':CtrlSF': '项目级 grep 搜索（侧边栏）',
    ':Ag': 'silver-searcher 搜索',
    # CtrlP（已迁移到 LeaderF，但仍可能在备用配置里）
    ':CtrlP': '模糊搜索文件',
    ':CtrlPBuffer': '模糊搜索 buffer',
    # LeaderF
    'Leaderf': '调用 LeaderF',
    'Leaderf gtags': 'LeaderF gtags 跨语言代码索引',
    # 通用 vim
    ':cclose': '关闭 quickfix 窗口',
    ':lclose': '关闭 location list 窗口',
    ':pclose': '关闭 preview 窗口',
    ':q': '关闭当前窗口',
    ':x': '保存并退出',
    ':wa': '保存所有 buffer',
    ':bd': '关闭当前 buffer',
    ':tabnew': '新建 tab',
    ':tabnext': '下一个 tab',
    ':tabprevious': '上一个 tab',
    ':tabclose': '关闭当前 tab',
    ':tabfirst': '第一个 tab',
    ':tablast': '最后一个 tab',
    ':bn': '下一个 buffer',
    ':bp': '上一个 buffer',
    # vim-fugitive
    ':G blame': 'git blame',
    ':G status': 'git status',
    ':Gdiff': 'git diff 当前文件',
    ':GMove': 'git mv',
    ':GBrowse': '在浏览器打开 GitHub/Bitbucket',
    # 其他
    ':TagbarToggle': '切换 Tagbar 大纲',
    ':Tagbar': '打开 Tagbar 大纲',
    ':GundoToggle': '切换 undo tree',
    ':Autoformat': '通用格式化（vim-autoformat）',
    ':Dash': '在 Dash 中查文档',
    ':Translate': '翻译光标下文本',
    ':TranslateW': '翻译并显示窗口',
    ':TranslateX': '翻译并替换',
    ':DlvAddBreakpoint': 'delve 添加断点',
    ':DlvDebug': 'delve 启动调试',
    ':DlvToggleTracepoint': 'delve toggle tracepoint',
    ':DlvRemoveBreakpoint': 'delve 删除断点',
    ':DlvClearAll': 'delve 清除所有断点',
    ':GoTests': '生成测试函数（gotests-vim）',
    ':NumberToggle': '切换相对/绝对行号',
    ':FixWhitespace': '清除尾部空白',
    ':SplitjoinSplit': '把单行拆成多行',
    ':SplitjoinJoin': '把多行合成单行',
    ':TableModeToggle': '切换表格模式',
    ':Colorizer': '渲染 hex/rgb 颜色',
    ':RGB2Term': '转换 RGB 到终端色',
    ':Term2RGB': '转换终端色到 RGB',
    ':MarkdownPreview': 'Markdown 浏览器预览',
    ':GenTocGFM': '生成 GitHub Markdown 目录',
    ':GenTocRedcarpet': '生成 Redcarpet 目录',
    ':TableFormat': '格式化表格',
    ':BookmarkToggle': '切换书签',
    ':BookmarkAnnotate': '为书签加注释',
    ':BookmarkNext': '下一个书签',
    ':BookmarkPrev': '上一个书签',
    ':BookmarkClear': '清空当前 buffer 书签',
    ':BookmarkClearAll': '清空所有书签',
    ':BookmarkShowAll': '显示所有书签',
    ':SyntasticCheck': 'syntastic 检查（已弃用）',
    ':Errors': '显示 syntastic 错误（已弃用）',
    ':lopen': '打开 location list',
    ':copen': '打开 quickfix',
    ':cprevious': 'quickfix 上一个',
    ':cnext': 'quickfix 下一个',
    ':cfirst': 'quickfix 第一个',
    ':cla': 'quickfix 显示全部',
    ':cr': 'quickfix 跳指定项',
    ':lla': 'location list 显示全部',
    ':lr': 'location list 跳指定项',
    ':NERDComToggleComment': 'NERDCommenter 切换注释',
    'YcmCompleter GoTo': 'YCM 跳定义',
    'YcmCompleter GoToReferences': 'YCM 找引用',
    'YcmCompleter GoToType': 'YCM 跳类型',
    ':YcmCompleter': 'YouCompleteMe 命令',
    'CocActionAsync': 'coc.nvim 异步动作',
    ':PlantumlOpen': '在浏览器预览 PlantUML',
    ':JavaImport': 'Java 导入',
    'UltiSnips#ExpandSnippetOrJump': 'UltiSnips 展开/跳转',
    'UltiSnips#JumpForwards': 'UltiSnips 下一占位符',
    'UltiSnips#JumpBackwards': 'UltiSnips 上一占位符',
}

# Plug 字典
PLUG_DESC = {
    'EasyAlign': '对齐选区/动作（vim-easy-align）',
    '(coc-codeaction-selected)': 'coc 对选区执行 code action',
    '(coc-codeaction)': 'coc code action',
    'TranslateX': '翻译并替换',
    'TranslateW': '翻译显示窗口',
    'Translate': '翻译',
    '(quickrun)': 'QuickRun 执行',
    '(qf-preview-open)': 'QuickFix 预览打开',
    '(complete_parameter#goto_next_parameter)': 'CompleteParameter 下一参数',
    '(complete_parameter#goto_previous_parameter)': 'CompleteParameter 上一参数',
}

def cmd_desc_lookup(rhs):
    """从 RHS 中查命令字典获取说明。"""
    s = rhs.strip()
    # 去掉尾部 <CR> <cr>
    s = re.sub(r'<[Cc][Rr]>\s*$', '', s).strip()
    # 截短
    s_short = s[:80]
    # 直接精确匹配
    for k, v in CMD_DESC.items():
        if s_short.startswith(k):
            return v
    # Plug 匹配
    m = re.search(r'<Plug>\(?([^()<>]+)\)?', s)
    if m:
        plug_name = m.group(1)
        for k, v in PLUG_DESC.items():
            if k in plug_name or k == plug_name:
                return v
        return f'Plug 触发：{plug_name}'
    # call 函数
    m = re.match(r':?call\s+(\w[\w#]+)', s)
    if m:
        return f'调用：{m.group(1)}()'
    # 简单命令
    m = re.match(r':(\w+)', s)
    if m:
        return f'执行 :{m.group(1)}'
    # ctrl-命令组合
    if s.startswith('<C-') or '<C-' in s:
        return ''
    # 其他短小 RHS
    if len(s) < 20:
        return f'即 `{s}`'
    return ''

def above_comment(lines, line_no, max_back=3):
    """获取 line_no 上方相邻的注释行内容。"""
    desc_parts = []
    i = line_no - 2  # 0-indexed, 上一行
    back = 0
    while i >= 0 and back < max_back:
        ln = lines[i].rstrip('\n').strip()
        if not ln:
            # 空行，停止往上找
            break
        if ln.startswith('"'):
            # 注释行
            comment = ln.lstrip('"').strip()
            if comment and not re.match(r'^=+$|^-+$|^#+$', comment):
                desc_parts.insert(0, comment)
            i -= 1
            back += 1
        else:
            break
    if desc_parts:
        # 去掉过于细节的（包含数字行号、纯路径）
        joined = ' / '.join(desc_parts)
        if len(joined) > 100:
            joined = joined[:97] + '...'
        return joined
    return ''

def derive_desc(lines, line_no, lhs, rhs):
    """从注释 + 命令字典 + RHS 推断说明。"""
    # 1) 优先取上方注释
    desc = above_comment(lines, line_no)
    # 注释中如果有 LHS 出现，多半是说明这个 mapping
    # 但很多注释是泛泛说 "##### 标题"
    if desc:
        # 太长截断
        if len(desc) > 80:
            desc = desc[:77] + '...'
        return desc
    # 2) 命令字典
    cmd = cmd_desc_lookup(rhs)
    if cmd:
        return cmd
    # 3) 兜底
    return ''

# 收集
SKIP_FILES = {"vimrc.lite"}
entries = []
for root, dirs, files in os.walk(CONFIG_DIR):
    for fname in sorted(files):
        if fname in SKIP_FILES:
            continue
        path = Path(root) / fname
        try:
            with open(path) as f:
                lines = f.readlines()
        except:
            continue
        for i, line in enumerate(lines, 1):
            res = parse_map_line(line)
            if res:
                au_prefix, mode, opts, lhs, rhs = res
                rel_file = str(path.relative_to(CONFIG_DIR.parent))
                desc = derive_desc(lines, i, lhs, rhs)
                entries.append({
                    'file': rel_file,
                    'line': i,
                    'mode': MODE_NAMES.get(mode, mode),
                    'opts': opts,
                    'lhs': lhs,
                    'rhs': rhs,
                    'au': au_prefix,
                    'desc': desc,
                })

# 同时扫描变量赋值形式的快捷键
# 比如 g:Lf_ShortcutF = '<leader>f'
EXTRA_PATTERNS = [
    (r"let\s+g:Lf_ShortcutF\s*=\s*['\"]([^'\"]+)['\"]",
     "Leaderf <CR>", "config/vimrc.bundles_base", "normal", "g:Lf_ShortcutF"),
    (r"let\s+g:Lf_ShortcutB\s*=\s*['\"]([^'\"]+)['\"]",
     "Leaderf buffer<CR>", "config/vimrc.bundles_base", "normal", "g:Lf_ShortcutB"),
    (r"let\s+g:lt_quickfix_list_toggle_map\s*=\s*['\"]([^'\"]+)['\"]",
     "QFixToggle (ListToggle)", "config/vimrc.bundles_base", "normal", "g:lt_quickfix..."),
    (r"let\s+g:lt_location_list_toggle_map\s*=\s*['\"]([^'\"]+)['\"]",
     "LocListToggle (ListToggle)", "config/vimrc.bundles_base", "normal", "g:lt_location..."),
    (r"set\s+pastetoggle=(\S+)",
     "toggle 'paste' option", "config/vimrc.config_base", "all", "set pastetoggle"),
    (r"let\s+g:UltiSnipsJumpForwardTrigger\s*=\s*\"([^\"]+)\"",
     "UltiSnips JumpForward", "config/vimrc.bundles_complex", "insert", "g:UltiSnipsJumpForwardTrigger"),
    (r"let\s+g:UltiSnipsJumpBackwardTrigger\s*=\s*\"([^\"]+)\"",
     "UltiSnips JumpBackward", "config/vimrc.bundles_complex", "insert", "g:UltiSnipsJumpBackwardTrigger"),
    (r"let\s+g:multi_cursor_next_key\s*=\s*'([^']+)'",
     "MultiCursor next", "config/vimrc.bundles_base", "normal", "g:multi_cursor_next_key"),
    (r"let\s+g:multi_cursor_prev_key\s*=\s*'([^']+)'",
     "MultiCursor prev", "config/vimrc.bundles_base", "normal", "g:multi_cursor_prev_key"),
    (r"let\s+g:multi_cursor_skip_key\s*=\s*'([^']+)'",
     "MultiCursor skip", "config/vimrc.bundles_base", "normal", "g:multi_cursor_skip_key"),
]

for root, dirs, files in os.walk(CONFIG_DIR):
    for fname in sorted(files):
        if fname in SKIP_FILES:
            continue
        path = Path(root) / fname
        try:
            with open(path) as f:
                content = f.read()
        except:
            continue
        for pat, desc, exp_file, mode, var_name in EXTRA_PATTERNS:
            for m in re.finditer(pat, content):
                lhs = m.group(1)
                line_no = content[:m.start()].count('\n') + 1
                rel = str(path.relative_to(CONFIG_DIR.parent))
                entries.append({
                    'file': rel, 'line': line_no, 'mode': mode,
                    'opts': '', 'lhs': lhs, 'rhs': desc,
                    'au': f'(via {var_name})',
                    'desc': desc,
                })

# 去重（同一 lhs+file+line）
seen = set()
unique_entries = []
for e in entries:
    key = (e['file'], e['line'], e['lhs'])
    if key not in seen:
        seen.add(key)
        unique_entries.append(e)
entries = unique_entries

# === 生成 Markdown ===

def fmt_lhs(lhs):
    """LHS 显示格式化。"""
    return f"`{lhs}`"

def fmt_rhs(rhs):
    """RHS 显示格式化（截断长字符串）。"""
    # 替换换行/特殊字符
    r = rhs.strip()
    if len(r) > 80:
        r = r[:77] + '...'
    # markdown 表格中转义 |
    r = r.replace('|', '\\|')
    return f"`{r}`"

def fmt_mode(mode, opts):
    badges = []
    if mode != 'all':
        badges.append(mode[:1].upper())
    if '<buffer>' in opts:
        badges.append('buf')
    if '<silent>' in opts:
        badges.append('sil')
    return ' '.join(badges) if badges else ''

# === 表 A：按字母排序（全局，去掉 buffer-local） ===
global_entries = [e for e in entries if not e['au']]
global_entries.sort(key=lambda e: normalize_lhs(e['lhs']))

# === 表 B：按文件分组 ===
by_file = defaultdict(list)
for e in entries:
    by_file[e['file']].append(e)

# 文件分类（友好名）
FILE_GROUPS = OrderedDict([
    ('config/vimrc',                    '入口（vimrc）'),
    ('config/vimrc.config_base',        '基础配置（vimrc.config_base）'),
    ('config/vimrc.bundles_base',       '主插件配置（vimrc.bundles_base）'),
    ('config/vimrc.bundles_complex',    '补全相关（vimrc.bundles_complex）'),
    ('config/vimrc.bundles_ycm',        'YouCompleteMe（vimrc.bundles_ycm）'),
    ('config/vimrc.bundles_simple',     '备用（vimrc.bundles_simple）'),
])

filetype_groups = OrderedDict()
for k, v in by_file.items():
    if k.startswith('config/filetype_bundles/'):
        ft = k.replace('config/filetype_bundles/', '').replace('.vim', '')
        filetype_groups[k] = f'文件类型：{ft}'

OUT = []
OUT.append("# Vim 快捷键速查表")
OUT.append("")
OUT.append(f"**生成日期**: 2026-05-08")
OUT.append(f"**总数**: {len(entries)} 个映射（含 nmap/imap/vmap/smap/map + 变量配置式）")
OUT.append(f"**全局映射**: {len(global_entries)}（不含 buffer-local 的 FileType 限定项）")
OUT.append("")
OUT.append("> **mode 列说明**：N=normal, I=insert, V=visual, S=select, C=cmdline；buf=buffer-local")
OUT.append("> **leader 设置**：`<leader>` = `<Space>`（vimrc:13）")
OUT.append("")
OUT.append("---")
OUT.append("")

def fmt_desc(d):
    if not d:
        return '—'
    d = d.replace('|', '\\|').strip()
    if len(d) > 60:
        d = d[:57] + '...'
    return d

# 表 A
OUT.append("## 一、全局快捷键（按字母排序）")
OUT.append("")
OUT.append("> 排序键：`<leader>X` 取 X，`gd` 取 g，`<F8>` 排到最后。说明列优先取上方注释，否则查命令字典。")
OUT.append("")
OUT.append("| 按键 | 模式 | 说明 | 命令 | 来源 |")
OUT.append("|------|:----:|------|------|------|")
for e in global_entries:
    OUT.append(f"| {fmt_lhs(e['lhs'])} | {fmt_mode(e['mode'], e['opts'])} | {fmt_desc(e.get('desc',''))} | {fmt_rhs(e['rhs'])} | `{e['file'].replace('config/','')}:{e['line']}` |")
OUT.append("")
OUT.append("---")
OUT.append("")

# 表 B
OUT.append("## 二、按文件 / 插件分组")
OUT.append("")

# 主分组
for fkey, label in FILE_GROUPS.items():
    if fkey not in by_file:
        continue
    OUT.append(f"### {label}")
    OUT.append("")
    OUT.append("| 按键 | 模式 | 说明 | 命令 | 行号 |")
    OUT.append("|------|:----:|------|------|------|")
    for e in sorted(by_file[fkey], key=lambda e: e['line']):
        if e['au']:
            scope_note = f" *{e['au']}*"
        else:
            scope_note = ''
        OUT.append(f"| {fmt_lhs(e['lhs'])} | {fmt_mode(e['mode'], e['opts'])} | {fmt_desc(e.get('desc',''))} | {fmt_rhs(e['rhs'])}{scope_note} | {e['line']} |")
    OUT.append("")

# filetype 分组
OUT.append("---")
OUT.append("")
OUT.append("## 三、文件类型相关（buffer-local，仅在对应 filetype 生效）")
OUT.append("")
for fkey, label in filetype_groups.items():
    if fkey not in by_file:
        continue
    OUT.append(f"### {label}")
    OUT.append("")
    OUT.append("| 按键 | 模式 | 说明 | 命令 | 行号 |")
    OUT.append("|------|:----:|------|------|------|")
    for e in sorted(by_file[fkey], key=lambda e: e['line']):
        OUT.append(f"| {fmt_lhs(e['lhs'])} | {fmt_mode(e['mode'], e['opts'])} | {fmt_desc(e.get('desc',''))} | {fmt_rhs(e['rhs'])} | {e['line']} |")
    OUT.append("")

OUT.append("---")
OUT.append("")
OUT.append("## 维护")
OUT.append("")
OUT.append("本表由 `tools/scan_keys.py`（如有）或手动 grep 生成；新增/修改快捷键时请重新生成本表。")
OUT.append("")
OUT.append("生成命令（参考）：")
OUT.append("```bash")
OUT.append("python3 /tmp/gen_keys_md.py")
OUT.append("```")
OUT.append("")
OUT.append(f"**最后更新**: 2026-05-08")

# 写文件
OUT_FILE.write_text('\n'.join(OUT))
print(f"已写入 {OUT_FILE}")
print(f"  总行数: {len(OUT)}")
print(f"  全局映射: {len(global_entries)}")
print(f"  按文件分组: {len(by_file)} 个文件")
