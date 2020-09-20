### Vim 配置
##################
# vim 配置文件目录
export VIM_CONFIG_PATH=$HOME/mydotfiles/b-dotfiles/b-vim/config
export VIM_TMP_PATH=$HOME/mydotfiles/b-dotfiles/b-vim/.vim
alias vimlite="vim -u $VIM_CONFIG_PATH/vimrc.lite"

# 快捷通达语法文件
export VIM_SYNTAX="$VIM_TMP_PATH/bundle/vim-custom-syntax/after/syntax/workspace_syntax.vim"
# 快捷通达代码片段目录
export VIM_SNIPS="$VIM_TMP_PATH/bundle/vim-snippets/UltiSnips"

# 打开临时 vim 文件
export TMP_DIR=$HOME/data/tmp
export CACHEFILEDIR=$TMP_DIR/CacheFiles
vimt() { nowdir=$CACHEFILEDIR/vimfile;  mkdir -p $nowdir; f=$nowdir/`date +%Y%m%d-%H%M%S`.txt; echo $f; vim $f; }
alias cdc="cd $CACHEFILEDIR"
alias cdcv="cd $CACHEFILEDIR/vimfile"
alias cdcm="cd $CACHEFILEDIR/mds"
alias cdcu="cd $CACHEFILEDIR/umls"
uml() {
    if [ -z "$@" ];then
        nowdir=$CACHEFILEDIR/umls;  mkdir -p $nowdir; vim $nowdir/`date +%Y%m%d-%H%M%S`.uml;
    else
        vim $@
    fi
}


######### go 文件和 cpp 文件的 ycm 切换
ycmcpp() {
    ycm_now="$VIM_TMP_PATH/bundle/YouCompleteMe"
    ycm_cur="$VIM_TMP_PATH/bundle/YouCompleteMe.cpp"
    [ -L $ycmdir ] && unlink $ycm_now
    ln -s $ycm_cur $ycm_now
    cat $ycm_now/version.txt
}
ycmgo() {
    ycm_now="$VIM_TMP_PATH/bundle/YouCompleteMe"
    ycm_cur="$VIM_TMP_PATH/bundle/YouCompleteMe.go"
    [ -L $ycmdir ] && unlink $ycm_now
    ln -s $ycm_cur $ycm_now
    cat $ycm_now/version.txt
}

# 使用coc补全
vimcoc(){
    linkfile="$VIM_TMP_PATH/vimrc.bundles_completion"
    [ -L $linkfile ] && unlink $linkfile && ln -s $VIM_TMP_PATH/vimrc.bundles_coc $linkfile
    echo "use coc for vim"
    vim $@
}

# 使用ycm补全
vimycm(){
    linkfile="$VIM_TMP_PATH/vimrc.bundles_completion"
    [ -L $linkfile ] && unlink $linkfile && ln -s $VIM_TMP_PATH/vimrc.bundles_ycm $linkfile
    echo "use ycm for vim"
    vim $@
}



