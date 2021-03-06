#!/bin/bash

DPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install ros
sudo apt update && sudo apt -y upgrade
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install -y ros-melodic-desktop-full python-pip python-rosdep python-catkin-tools
sudo rosdep init
rosdep update
mkdir -p ~/catkin_ws/src
ln -fs $dpath/.ycm_extra_conf.py ~/catkin_ws/src/.ycm_extra_conf.py
