#!/bin/bash

# install ros
sudo apt update && sudo apt upgrade
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update
sudo apt install -y ros-melodic-desktop-full python-pip python-rosdep python-catkin-tools
sudo rosdep init
rosdep update
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
if [ ! -f ~/.zshrc ]; then
  echo "source /opt/ros/melodic/setup.zsh" >> ~/.zshrc
  echo "source ~/catkin_ws/devel/setup.zsh" >> ~/.zshrc
fi
mkdir -p ~/catkin_ws/src
ln -s $dpath/.ycm_extra_conf.py ~/catkin_ws/src/.ycm_extra_conf.py
