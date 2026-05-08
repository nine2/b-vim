#!/usr/bin/env bash
# tools/migrate_bundle_to_plug.sh
# Vundle → vim-plug 迁移：把指定文件中的 `Bundle ` 替换为 `Plug `
# 保留所有缩进、引号、选项、注释。
#
# 用法：
#   tools/migrate_bundle_to_plug.sh <file1> [file2 ...]
#   tools/migrate_bundle_to_plug.sh --dry-run <file>     # 预览不写入
#
# 注意：本脚本仅做语法替换；vimrc.bundles_base 的 init 段
# (vundle#rc → plug#begin/end) 需手动 Edit。

set -euo pipefail

DRY_RUN=0
if [[ "${1:-}" == "--dry-run" ]]; then
    DRY_RUN=1
    shift
fi

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 [--dry-run] <file1> [file2 ...]" >&2
    exit 1
fi

for f in "$@"; do
    if [[ ! -f "$f" ]]; then
        echo "skip (not a file): $f" >&2
        continue
    fi
    count=$(grep -cE '^\s*Bundle ' "$f" || true)
    if [[ "$DRY_RUN" -eq 1 ]]; then
        echo "[dry-run] $f → $count 处 Bundle 会被替换为 Plug"
        grep -nE '^\s*Bundle ' "$f" | sed 's/Bundle /Plug /'
    else
        sed -i '' 's/^\([[:space:]]*\)Bundle /\1Plug /' "$f"
        echo "$f → $count 处 Bundle → Plug"
    fi
done
