#########################################################################
# File Name: install.sh
# Author: zhangzhe
# mail: xiaoyiqingz@163.com
# Created Time: Sat 01 Apr 2017 05:14:04 PM CST
#########################################################################
#!/bin/bash

cp .vimrc* ~/
cp -r  others/. ~/

if command -v git >/dev/null 2>&1; then
    echo 'exists git'
else
    apt-get install git
fi

if command -v tmux >/dev/null 2>&1; then
    echo 'exists git'
else
    apt-get install tmux
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

