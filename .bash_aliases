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

# git related
alias gits="git status"
alias git-pull-all="ls | parallel git -C {} pull"

# catkin workspace and ros
alias ws="cd ~/catkin_ws"
alias repos="cd ~/catkin_ws/src"
alias catkin_ignore="find . -type d -exec touch {}/CATKIN_IGNORE \;"
alias catkin_unignore="find . -type d -exec rm {}/CATKIN_IGNORE \;"
alias rosdep-install='rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO  -yr'
alias reconf="rosrun rqt_reconfigure rqt_reconfigure"

# tar/untar aliases
alias tar-gz='tar czf'
alias tar-bz2='tar cjf'
alias untar-gz='tar xzf'
alias untar-bz2='tar xjf'

# copy public key to remote machine eg. keyto example@example-ip
alias keyto='ssh-copy-id'
