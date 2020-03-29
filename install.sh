#!/bin/sh

dpath=$(pwd)

# link dotfiles
ln -fs $dpath/.bashrc ~/.bashrc
ln -fs $dpath/.aliases ~/.aliases
ln -fs $dpath/.bash_scripts ~/.bash_scripts
sudo pacman -S --noconfirm git
ln -fs $dpath/.gitconfig ~/.gitconfig
ln -fs $dpath/.gitignore_global ~/.gitignore_global

# install zsh
sh $dpath/install_zsh.sh

# install vim
sh $dpath/install_vim.sh

# install ros
#sh $dpath/install_ros.sh

# install ros2
#sh $dpath/install_ros2.sh
