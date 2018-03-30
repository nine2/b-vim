# 文件说明
---
vim.install
此目录下的文件为从源码编译安装 vim 时使用的参数！
vim.config
此目录下文件为 vim 配置文件！

使用后，会自动生成一个 .vim 目录，用来存放相关插件等，即为 runtimepath。

# 安装说明

```
git clone https://github.com/nine2/b-vim.git
cd b-vim/install-shell
./install-vim.sh
```

插件管理使用 Vundle, 插件管理使用 Vundle 的方式。
插件命令使用的是 Bundle，因此新增插件时使用 Bundle, 如：
加入插件 "github/eg"，则在 vimrc.bundles_base 里增加：
```
Bundle "github/eg"
```
然后 打开 vim, 使用命令 `:BundleInstall` 安装插件，安装后重新打开 vim 即可使用。

# 注意
由于部分插件的原因，需要 vim7.4 以上版本！
