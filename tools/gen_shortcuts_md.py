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
                # 跳过 <Plug>(...)
                # 不跳过——<Plug> 本身就是一种 mapping
                rel_file = str(path.relative_to(CONFIG_DIR.parent))
                entries.append({
                    'file': rel_file,
                    'line': i,
                    'mode': MODE_NAMES.get(mode, mode),
                    'opts': opts,
                    'lhs': lhs,
                    'rhs': rhs,
                    'au': au_prefix,
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

# 表 A
OUT.append("## 一、全局快捷键（按字母排序）")
OUT.append("")
OUT.append("> 排序键：`<leader>X` 取 X，`gd` 取 g，`<F8>` 排到最后。")
OUT.append("")
OUT.append("| 按键 | 模式 | 命令 | 文件 |")
OUT.append("|------|:----:|------|------|")
for e in global_entries:
    OUT.append(f"| {fmt_lhs(e['lhs'])} | {fmt_mode(e['mode'], e['opts'])} | {fmt_rhs(e['rhs'])} | `{e['file'].replace('config/','')}:{e['line']}` |")
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
    OUT.append("| 按键 | 模式 | 命令 | 行号 |")
    OUT.append("|------|:----:|------|------|")
    for e in sorted(by_file[fkey], key=lambda e: e['line']):
        scope = '🔵' if e['au'] else ''  # buffer-local 标记
        if e['au']:
            scope_note = f" *{e['au']}*"
        else:
            scope_note = ''
        OUT.append(f"| {fmt_lhs(e['lhs'])} | {fmt_mode(e['mode'], e['opts'])} | {fmt_rhs(e['rhs'])}{scope_note} | {e['line']} |")
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
    OUT.append("| 按键 | 模式 | 命令 | 行号 |")
    OUT.append("|------|:----:|------|------|")
    for e in sorted(by_file[fkey], key=lambda e: e['line']):
        OUT.append(f"| {fmt_lhs(e['lhs'])} | {fmt_mode(e['mode'], e['opts'])} | {fmt_rhs(e['rhs'])} | {e['line']} |")
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
