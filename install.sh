#!/bin/sh

dpath=$(pwd)

# link dotfiles
ln -fs $dpath/.bashrc ~/.bashrc
ln -fs $dpath/.aliases ~/.aliases
ln -fs $dpath/.bash_scripts ~/.bash_scripts
sudo apt-get install git && ln -fs $dpath/.gitconfig ~/.gitconfig

# install zsh
sh $dpath/zsh_installer.sh

# link main dirs to storage drive ones
#rm -r ~/Desktop && ln -fs /media/gkouros/STORAGE/Desktop ~/Desktop
#rm -r ~/Documents && ln -fs /media/gkouros/STORAGE/Documents ~/Documents
#rm -r ~/Music && ln -fs /media/gkouros/STORAGE/Music ~/Music
#rm -r ~/Pictures && ln -fs /media/gkouros/STORAGE/Pictures ~/Pictures
#rm -r ~/Videos && ln -fs /media/gkouros/STORAGE/Videos ~/Videos
#rm -r ~/Downloads && ln -fs /media/gkouros/STORAGE/Downloads ~/Downloads

#sudo sed -i '$a\# STORAGE\nUUID=462E78EF08044B31 /media/gkouros/STORAGE ntfs-3g users,permissions,auto 0 0' /etc/fstab

# install vim and plugins
sudo apt install vim-gnome-py2 -y
sudo apt install software-properties-common python-software-properties -y
ln -s $dpath/.vimrc ~/.vim/vimrc
sudo ln -fs ~/.vim/vimrc /etc/vim/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:vim-scripts/python.vim.git ~/.vim/python.vim
git clone git@github.com:powerline/fonts.git ~/.vim/fonts
vim +PluginInstall +qall
~/.vim/fonts/install.sh
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

# add ppas for my weather indicator widget
sudo add-apt-repository ppa:atareao/atareao -y
# add ppas for numix themes
sudo add-apt-repository ppa:numix/ppa -y


# install programs from file
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
for program in `cat programs_list.txt`
do
	echo "\033[0;32mInstalling $program\033[0m"
	sudo apt-get install $program -y
done

# fix issues with nvidia issue with suspend
#sudo sed -i '/GRUB_CMDLINE_LINUX=""/c\GRUB_CMDLINE_LINUX="acpi_sleep=nonvs"' /etc/default/grub

# enable numlock at startup
#sudo sed -i '$a\greeter-setup-script=/usr/bin/numlockx on' /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf

# fix brightness adjustment
#sudo cp 10-nvidia-brightness.conf /usr/share/X11/xorg.conf.d/10-nvidia-brightness.conf
#sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/c\GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_backlight=vendor"' /etc/default/grub
#sudo sed -i 's|^exit 0.*$|# Set full brightness\necho 8 > /sys/class/backlight/acpi_video0/brightness\n\nexit 0|' /etc/rc.local

# install ros
sudo apt install python-pip python-catkin-tools -y
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update
sudo apt install ros-kinetic-desktop-full -y
sudo apt install python-rosdep -y
sudo apt install python-catkin-tools -y
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
mkdir -p ~/catkin_ws/src
#ln -s ~/Dropbox/catkin_ws_src ~/catkin_ws/src
ln -s $dpath/.ycm_extra_conf.py ~/catkin_ws/src/.ycm_extra_conf.py
cd ~/catkin_ws/src && rosdep install --from-paths src --ignore-src
