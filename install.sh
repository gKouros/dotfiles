#!/bin/sh

dpath=$(pwd)

# link dotfiles
ln -fs $dpath/.bashrc ~/.bashrc
ln -fs $dpath/.aliases ~/.aliases
ln -fs $dpath/.bash_scripts ~/.bash_scripts
sudo apt-get install git && ln -fs $dpath/.gitconfig ~/.gitconfig

# install zsh
sh $dpath/zsh_installer.sh

# install vim and plugins
sh $dpath/vim_installer.sh

# install programs from file
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
for program in `cat programs_list.txt`
do
	echo "\033[0;32mInstalling $program\033[0m"
	sudo apt-get install $program -y
done
