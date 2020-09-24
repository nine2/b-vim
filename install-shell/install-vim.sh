#!/bin/bash
# ====================================================
#   Copyright (C)2015 All rights reserved.
#
#   Author        : bbxytl
#   Email         : bbxytl@gmail.com
#   File Name     : install-vim.sh
#   Last Modified : 2018-03-17 14:54
#   Describe      :
#
#   Log           :
#
# ====================================================

lnif() {
	if [ -e "$1" ]; then
		ln -sf "$1" "$2"
	fi
}

# 安装启用的环境变量
BASEDIR=$(dirname $0)
cd $BASEDIR
pwd
CURRENT_DIR=$(pwd)
ROOT_PATH=$(
	cd ../
	pwd
)
# 基本配置目录
VIM_CONFIG_PATH="$ROOT_PATH/config"
VIM_TMP_PATH="$ROOT_PATH/.vim"
mkdir -p $VIM_TMP_PATH

VIM_BUNDLE_FILE="$VIM_CONFIG_PATH/vimrc.bundles_simple"
# 默认安装 simple 版
COMPLEX=false
if [ $# -ge 1 ]; then
	if [ $1="--complex" ]; then
		COMPLEX=true
		VIM_BUNDLE_FILE="$VIM_CONFIG_PATH/vimrc.bundles_complex"
	else
		echo "Error arg! no arg to rum simple , arg: --complex to use ycm and so on !"
		exit
	fi
fi
lnif $VIM_BUNDLE_FILE $VIM_TMP_PATH/vimrc.bundles


# 保留 从 github 上搞来的配置
echo " Step 0: bucking up current config"
if [ -e $HOME/.vimrc ]; then mv $HOME/.vimrc $HOME/.vimrc_other; fi
today=$(date +%Y%m%d)
ORG_CONFIG_BAK="$VIM_TMP_PATH/orgConfigBak"
mkdir -p $ORG_CONFIG_BAK
vimbak="$ORG_CONFIG_BAK/ori-vim.$today"
mkdir -p $vimbak
for i in $HOME/.vim/tags_list; do [ -L $i ] && unlink $i; done
for i in $HOME/.vim/tags_list; do [ -e $i ] && cp $i $i.bak; done

echo " Step 1: add config to $BASHRC_FILE"
TMP_ENV_FILE="vim-tmp-env-file"
echo "export VIM_CONFIG_PATH=$VIM_CONFIG_PATH" >$TMP_ENV_FILE
echo "export VIM_TMP_PATH=$VIM_TMP_PATH" >>$TMP_ENV_FILE
[[ -f $HOME/.bashrc ]] && cat $TMP_ENV_FILE >> $HOME/.bashrc
[[ -f $HOME/.zshrc ]] && cat $TMP_ENV_FILE >> $HOME/.zshrc
rm $TMP_ENV_FILE

echo " Step 2: setting tu symlinks"
lnif $VIM_CONFIG_PATH/vimrc $HOME/.vimrc

echo " Step 3: vim bk and undo dir and swp and view"
mkdir -p \
	$VIM_TMP_PATH/bundle \
	$VIM_TMP_PATH/vimbackup \
	$VIM_TMP_PATH/vimundo \
	$VIM_TMP_PATH/vimview \
	$VIM_TMP_PATH/vimswap

echo " Step 4: link tags_list"
SYS_VERSION=`uname -s`
projects=$VIM_CONFIG_PATH/projects
if [ $SYS_VERSION = 'Darwin' ];then
    lnif $projects/tags_list_mac $VIM_TMP_PATH/tags_list
else if [ $SYS_VERSION = 'Linux' ];then
    lnif $projects/tags_list_linux $VIM_TMP_PATH/tags_list
    fi
fi

echo " Step 5: install plugins"
grep "^Bundle [',\"]\S*/" $VIM_CONFIG_PATH/vimrc.bundles_base \
	| sed "s/Bundle [',\"]/https:\/\/github.com\//g" | sed "s/[',\"]//g" | cut -d ' ' -f1 \
	| while read line;do \
		dirname=`echo ${line##*/} | sed 's/ //g'`; \
		echo "git clone --depth 1 --recursive $line  $VIM_TMP_PATH/bundle/$dirname"; \
		git clone --depth 1 --recursive $line  $VIM_TMP_PATH/bundle/$dirname; \
	done
grep "^Bundle [',\"]\S*/" $VIM_BUNDLE_FILE \
	| sed "s/Bundle [',\"]/https:\/\/github.com\//g" | sed "s/[',\"]//g" | cut -d ' ' -f1 \
	| while read line;do \
		dirname=`echo ${line##*/} | sed 's/ //g'`; \
		echo "git clone --depth 1 --recursive $line  $VIM_TMP_PATH/bundle/$dirname"; \
		git clone --depth 1 --recursive $line  $VIM_TMP_PATH/bundle/$dirname; \
	done

cat ./vim_config_bashrc.sh >> ~/.bashrc.local
# system_shell=$SHELLL
# export SHELL="/bin/sh"
# vim +BundleInstall! +BundleClean +qall
# export SHELL=$system_shell

# 编译前确定安装了：sudo apt-get install python2.7-dev
#                   sudo yum install python-devel

# echo "Step5: compile YouCompleteMe"
# echo "It will take a long time, just be patient!"
# echo "If error,you need to compile it yourself"
# echo "cd $VIM_TMP_PATH/bundle/YouCompleteMe/ && bash -x install.sh --clang-completer"
# cd $VIM_TMP_PATH/bundle/YouCompleteMe/
# if [ `which clang` ]   # check system clang
# then
# bash -x install.sh --clang-completer --system-libclang   # use system clang
# else
# bash -x install.sh --clang-completer
# fi

