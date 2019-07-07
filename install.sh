#!/bin/bash

DPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# link dotfiles
ln -fs $DPATH/.bashrc ~/.bashrc
ln -fs $DPATH/.aliases ~/.aliases
ln -fs $DPATH/.bash_scripts ~/.bash_scripts
sudo apt-get install git && ln -fs $DPATH/.gitconfig ~/.gitconfig

# install zsh
sh $DPATH/zsh_installer.sh

# install vim and plugins
sh $DPATH/vim_installer.sh

# install programs from file
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
for program in `cat $DPATH/programs_list.txt`
do
	echo "\033[0;32mInstalling $program\033[0m"
	sudo apt-get install $program -y
done
