# 文件说明
---
vim.install
此目录下的文件为从源码编译安装 vim 时使用的参数！
vim.config
此目录下文件为 vim 配置文件！

使用后，会自动生成一个 .vim 目录，用来存放相关插件等，即为 runtimepath。

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


插件管理使用 Vundle, 插件管理使用 Vundle 的方式。
插件命令使用的是 Bundle，因此新增插件时使用 Bundle, 如：
加入插件 "github/eg"，则在 vimrc.bundles_base 里增加：
```
Bundle "github/eg"
```
然后 打开 vim, 使用命令 `:BundleInstall` 安装插件，安装后重新打开 vim 即可使用。

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
