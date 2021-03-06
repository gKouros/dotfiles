#!/bin/bash

DPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install vim and plugins
sudo apt-get -y install vim exuberant-ctags build-essential cmake python-dev python3-dev g++ grip xdotool
ln -fs $DPATH/.vimrc ~/.vim/vimrc
sudo ln -fs ~/.vim/vimrc /etc/vim/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/vim-scripts/python.vim.git ~/.vim/python.vim
git clone https://github.com/powerline/fonts.git ~/.vim/fonts
~/.vim/fonts/install.sh
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
~/.vim/bundle/YouCompleteMe/install.py --clang-completer
vim +PluginInstall +qall
