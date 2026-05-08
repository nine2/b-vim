# 文件说明
---
vim.install
此目录下的文件为从源码编译安装 vim 时使用的参数！
vim.config
此目录下文件为 vim 配置文件！

使用后，会自动生成一个 .vim 目录，用来存放相关插件等，即为 runtimepath。

## 参考文档

| 文档 | 内容 |
|---|---|
| [`SHORTCUTS.md`](./SHORTCUTS.md) | 全部快捷键速查表（按字母排序 + 按文件分组），由 `tools/gen_shortcuts_md.py` 自动生成 |
| [`PLUGIN_DEPENDENCIES.md`](./PLUGIN_DEPENDENCIES.md) | 插件外部依赖配置表（系统命令 / 二进制 / 字体等的安装命令） |

## 工具脚本（`tools/`）

| 脚本 | 用途 | 触发时机 |
|---|---|---|
| `tools/gen_shortcuts_md.py` | 扫描 `config/` 生成 `SHORTCUTS.md` | 新增/修改快捷键后重跑 |

执行：

```bash
python3 ~/mydotfiles/b-dotfiles/b-vim/tools/gen_shortcuts_md.py
```

# 安装说明

- 可参考文档说明: [vim极简完美配置b-vim（一）安装教程及目录说明][jianshu-vim-doc]

```
git clone https://github.com/nine2/b-vim
cd b-vim/install-shell
./install-vim.sh
```

- 简装版，没有使用任何需要安装的插件（vim），安装方式：`sh install-vim.sh`
- 全配版，特别区别是使用了 `YouCompleteMe` vim 插件！安装方式：`sh install-vim.sh  --complex`
- 如果使用 complex 版，需要编译安装 [YouCompleteMe][YouCompleteMe] 时，如果失败，请查看 **[文档][YCM-doc]** ;


插件管理使用 [vim-plug](https://github.com/junegunn/vim-plug)（2026-05-08 从 Vundle 迁移）。
插件命令使用 `Plug`，新增插件时在 vimrc.bundles_base 里增加：
```
Plug 'github/eg'
```
然后打开 vim 执行 `:PlugInstall` 安装插件，安装后重新打开 vim 即可使用。

vim-plug 常用命令：
- `:PlugInstall`  安装新增插件
- `:PlugUpdate`   更新所有插件
- `:PlugStatus`   查看插件状态
- `:PlugClean`    ⚠️ **不要使用**（会误删 YouCompleteMe / vim-go 软链）

> 软链特例（`YouCompleteMe`、`vim-go`、`ycm_simple_conf`）通过 vimrc.bundles_base 末尾
> 的 `set rtp+=` 加载，不纳入 vim-plug 管理；以保护其软链结构不被 :PlugClean 误删。

> vundle 历史目录已归档至 `.vim/bundle.archive/vundle/`，可随时恢复。

# workspace.vim 使用说明

将下面的 bash 函数copy 到 `~/.bashrc` 里，将 `DOT_CONFIG_BDOT` 修改为你自己存放b-vim的目录.
`source ~/.bashrc` 后在自己的项目目录里使用命令：`proconf` 即可生成根据项目自定义的 `.workspace.vim`文件，
以及给 [nine2/vim-custom-syntax][vim-custom-syntax] 使用的自定义语法高亮 `.workspace_syntax.vim` 文件.

```
export DOT_CONFIG_BDOT="$HOME/mydotfiles/b-dotfiles"
proconf(){
	workspace_vim=".workspace.vim"
	if [ ! -f $workspace_vim ];then
		cp $DOT_CONFIG_BDOT/b-vim/config/projects/workspace.vim $workspace_vim
		echo "" >> $workspace_vim
		echo "set path+=,`pwd`/**" >> $workspace_vim
		echo "set tags+=`pwd`/tags" >> $workspace_vim
		echo "" >> $workspace_vim
		echo "let g:cust_vim_tmp_path_dir = \"`pwd`/.vim\"" >> $workspace_vim
		echo "set backupdir=`pwd`/.vim/vimbackup" >> $workspace_vim
		echo "set viewdir=`pwd`/.vim/vimview" >> $workspace_vim
		echo "set dir=`pwd`/.vim/vimswap" >> $workspace_vim
		echo "set undodir=`pwd`/.vim/vimundo" >> $workspace_vim
		echo "" >> $workspace_vim
	fi
	workspace_vim=".workspace_syntax.vim"
	if [ ! -f $workspace_vim ];then
		cp $DOT_CONFIG_BDOT/b-vim/config/projects/workspace_syntax.vim $workspace_vim
	fi
}
```


# 注意
由于部分插件的原因，需要 vim7.4 以上版本！

# 配置学习
- 本配置的部分可直接查看 vimrc 和 其他 vim 配置文件 进行查看
- 其他学习推荐：[use_vim_as_ide][use_vim_as_ide]

[use_vim_as_ide]: https://github.com/bbxytl/use_vim_as_ide
[YouCompleteMe]: http://valloric.github.io/YouCompleteMe/
[YCM-doc]: https://github.com/Valloric/YouCompleteMe
[jianshu-vim-doc]: https://www.jianshu.com/p/ebf1cfaeaddc
[vim-custom-syntax]: https://github.com/nine2/vim-custom-syntax
