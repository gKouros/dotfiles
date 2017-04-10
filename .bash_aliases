# package management
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias dist-upgrade='sudo apt-get dist-upgrade'
alias apt-search='sudo aptitude search'

# frequently used folders
alias ~='cd ~'
alias desktop='cd ~/Desktop'
alias downloads='cd ~/Downloads'
alias storage='cd /media/gkouros/STORAGE'

# linux usefull aliases
alias sb="source ~/.bashrc"
alias set-zsh="chsh -s $(which zsh)"
alias set-bash="chsh -s $(which bash)"
alias print-interfaces="ls /sys/class/net/"
alias public_ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias local_ip="$(hostname -I)"
alias delnewline="rename 's/\n/ /g' *" # delete new line char from filenames

# catkin specific
alias catkin_ignore="find . -type d -exec touch {}/CATKIN_IGNORE \;"
alias catkin_unignore="find . -type d -exec rm {}/CATKIN_IGNORE \;"

# catkin workspace, git and ros
alias ws="cd /home/gkouros/pandora_ws"
alias gws="source ~/gkouros_ws/devel/setup.bash && cd ~/gkouros_ws"
alias repos="cd ~/pandora_ws/src"
alias cmo="catkin_make --only-pkg-with-deps"
alias cmr="catkin_make -DCATKIN_WHITELIST_PACKAGES="""
alias gits="git status"
alias git-pull-all="ls | parallel git -C {} pull"
alias rosdep-install='rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO  -r'

# tar/untar aliases
alias tar-gz='tar czf'
alias tar-bz2='tar cjf'
alias untar-gz='tar xzf'
alias untar-bz2='tar xjf'

# copy public key to remote machine eg. keyto example@example-ip
alias keyto='ssh-copy-id'

# ros and pandora related aliases
alias gazmon="roslaunch pandora_gazebo_worlds simple_ramps.launch robot:=monstertruck"
alias panzebo="roslaunch pandora_launchers simulation_monstertruck.launch gazebo:=true local_planner:=rsband global_planner:=global"
alias vizmon="roslaunch pandora_monstertruck_2dnav rviz.launch"
alias ak="rosrun ackermann_drive_teleop keyop.py"
alias akm="rosrun ackermann_drive_teleop keyop.py 0.2 0.4"
alias fws="roslaunch four_wheel_steer_teleop teleop.launch cmd_topic:=/keyop/cmd_vel max_speed:=0.2 max_steering_angle:=0.4"
alias fws2="roslaunch four_wheel_steer_teleop teleop.launch"
alias jk="roslaunch ackermann_drive_teleop ackermann_drive_joyop.launch"
alias pk="rosrun pandora_teleop keyop.py 0.5 0.7 /cmd_vel"
alias pj="rosrun pandora_teleop joyop.py"
alias gui="/home/gkouros/pandora_ws/src/dashboard/gui"
alias sm="rosrun state_manager state_changer"
alias viz="roslaunch pandora_runtime_visualization visualization.launch"
alias dashboard="cd ~/pandora_ws/src/dashboard"
alias face-detector="rosrun viola_jones face_detector.py"
alias save-params="rosrun dynamic_reconfigure dynparam dump /move_base ~/Desktop/move_base_params.yaml"
alias reconf="rosrun rqt_reconfigure rqt_reconfigure"
alias explore="rosrun pandora_explorer exploration_caller.py explore"
alias simon="roslaunch pandora_monstertruck_2dnav simulation.launch pandora_exploration:=true state:=1"
alias save_map="rosrun map_server map_saver /map:=/slam/map -f" # eg. save_map cool_map_name
alias sshpg="ssh -AX pandora@192.168.0.106"
alias xm="export ROS_MASTER_URI=http://192.168.0.106:11311"
alias sshpi="ssh -AX pandora@192.168.0.150"
alias xp="export ROS_MASTER_URI=http://192.168.0.150:11311"

# MISC
alias pop='/home/gkouros/Popcorn-Time-0.3.10-Linux-64/Popcorn-Time'
