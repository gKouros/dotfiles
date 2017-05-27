#!/bin/bash
ZSH=~/.oh_my_zsh
ZSH_CUSTOM=~/.oh-my-zsh/custom
dpath=$(pwd)

# Install oh_my_zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install zsh_autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install zsh_syntax_highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Install zsh_history_substring_search
git clone https://github.com/zsh-users/zsh-history-substring-search.git $ZSH_CUSTOM/plugins/zsh-history-substring-search

ln -s $dpath/.zshrc ~/.zshrc
ln -s $dpath/my.zsh-theme $ZSH/themes/my_zsh_theme.zsh-theme
