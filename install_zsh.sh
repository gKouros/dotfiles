#!/bin/bash
ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.oh-my-zsh/custom
dpath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install zsh
sudo apt install -y zsh wget

# Install oh_my_zsh
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | zsh || true

# Install zsh_autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install zsh_syntax_highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Install zsh_history_substring_search
git clone https://github.com/zsh-users/zsh-history-substring-search.git $ZSH_CUSTOM/plugins/zsh-history-substring-search

ln -sf $dpath/.zshrc ~/.zshrc
ln -sf $dpath/my.zsh-theme $ZSH/themes/my_zsh_theme.zsh-theme
sudo ln -sf $HOME/.oh-my-zsh /root/.oh-my-zsh
sudo ln -sf $HOME/.zshrc /root/.zshrc

sudo chsh -s /bin/zsh $USER
