" 在 vim-markdown 语法之后加载：列表符号 / 复选框替换显示（配合 conceallevel=2）
" 配色见 filetype_bundles/markdown.vim 的 s:MdHighlight()
syntax match mdBullet /^\s*\zs[-*+]\ze\s\+/ contained containedin=mkdListItemLine conceal cchar=•
syntax match mdTodo /\[ \]\ze\s/ contained containedin=mkdListItemLine conceal cchar=☐
syntax match mdDone /\[[xX]\]\ze\s/ contained containedin=mkdListItemLine conceal cchar=☑

" 引用：行首 > 显示为竖条 ▍
syntax match mdQuoteBar /^\s*\zs>/ contained containedin=mkdBlockquote conceal cchar=▍

" 表格：竖线 / 分隔行上色、表头行加粗（不做 conceal 替换：cchar 只能统一用 Conceal 色，
" 且框线字符是宽度不确定字符，容易破坏 vim-table-mode 的对齐）
" 只匹配以 | 开头的行（GFM 常见写法）
syntax match mdTableRow /^\s*|.*$/ containedin=mkdNonListItemBlock contains=mdTablePipe,htmlBold,htmlItalic,mkdCode,mkdLink,mkdInlineURL,mkdStrike
syntax match mdTableHead /^\s*|.*\n\ze\s*|\s*:\=-\+/ containedin=mkdNonListItemBlock contains=mdTablePipe,htmlBold,htmlItalic,mkdCode
syntax match mdTableSep /^\s*|\%(\s*:\=-\+:\=\s*|\)\+\s*$/ containedin=mkdNonListItemBlock
syntax match mdTablePipe /|/ contained

" 分隔线 --- / *** / ___：按 vim-markdown 原定义加 conceal 隐藏原文，
" 由 markdown.vim 的虚拟文本画一条横贯窗口的彩色细线（光标行显示原文）
" \%>1l：不匹配第 1 行，否则会抢在 YAML front matter（start="\%^---$"）之前命中，
" 导致 front matter 失效、其末行 key 与结尾 --- 被误识别为 setext 二级标题
syntax match mkdRule /\%>1l^\s*\*\s\{0,1}\*\s\{0,1}\*\(\*\|\s\)*$/ conceal
syntax match mkdRule /\%>1l^\s*-\s\{0,1}-\s\{0,1}-\(-\|\s\)*$/ conceal
syntax match mkdRule /\%>1l^\s*_\s\{0,1}_\s\{0,1}_\(_\|\s\)*$/ conceal

" YAML front matter 首尾的 --- 单独着色：vim-markdown 用的是通用的 mkdDelimiter
"（链接括号等也用它），这里按原定义重新声明 region，只把 matchgroup 换成独立组
if get(g:, 'vim_markdown_frontmatter', 0)
    syntax region Comment matchgroup=mdFrontMatterDelim start="\%^---$" end="^\(---\|\.\.\.\)$" contains=@yamlTop keepend
endif

" 标题的 # 按级别着色并隐藏：vim-markdown 六级共用 matchgroup=mkdHeading，无法分级，
" 这里重新声明（同起点时后定义者优先，顺序须保持 H1→H6），只换 matchgroup。
" 要求 # 后跟空白，# 号精确匹配级别；concealends 把 # 藏掉，由 markdown.vim 的
" 虚拟文本补上 H1~H6 标签（光标行不隐藏，显示原文）
syntax region htmlH1 matchgroup=mdH1Mark start="^\s*#\ze\s"      end="$" concealends contains=@mkdHeadingContent,@Spell
syntax region htmlH2 matchgroup=mdH2Mark start="^\s*##\ze\s"     end="$" concealends contains=@mkdHeadingContent,@Spell
syntax region htmlH3 matchgroup=mdH3Mark start="^\s*###\ze\s"    end="$" concealends contains=@mkdHeadingContent,@Spell
syntax region htmlH4 matchgroup=mdH4Mark start="^\s*####\ze\s"   end="$" concealends contains=@mkdHeadingContent,@Spell
syntax region htmlH5 matchgroup=mdH5Mark start="^\s*#####\ze\s"  end="$" concealends contains=@mkdHeadingContent,@Spell
syntax region htmlH6 matchgroup=mdH6Mark start="^\s*######\ze\s" end="$" concealends contains=@mkdHeadingContent,@Spell
