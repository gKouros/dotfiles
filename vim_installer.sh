#!/bin/bash

# install vim and plugins
sudo apt-get -y install vim exuberant-ctags build-essential cmake python3-dev
ln -s $(pwd)/.vimrc ~/.vim/vimrc
sudo ln -fs ~/.vim/vimrc /etc/vim/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/vim-scripts/python.vim.git ~/.vim/python.vim
git clone https://github.com/powerline/fonts.git ~/.vim/fonts
vim +PluginInstall +qall
~/.vim/fonts/install.sh
~/.vim/bundle/YouCompleteMe/install.py --clang-completer
