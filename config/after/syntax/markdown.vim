" 在 vim-markdown 语法之后加载：列表符号 / 复选框替换显示（配合 conceallevel=2）
" 配色见 filetype_bundles/markdown.vim 的 s:MdHighlight()
syntax match mdBullet /^\s*\zs[-*+]\ze\s\+/ contained containedin=mkdListItemLine conceal cchar=•
syntax match mdTodo /\[ \]\ze\s/ contained containedin=mkdListItemLine conceal cchar=☐
syntax match mdDone /\[[xX]\]\ze\s/ contained containedin=mkdListItemLine conceal cchar=☑
