#!/bin/bash

sudo apt install -y neovim python3 python3-pip xdotool uncrustify curl universal-ctags
pip3 install --user neovim pynvim grip jedi \
    yapf cmake-format remark pyaml flake8 pylint
pip3 install --user 'msgpack>=1.0.0'
mkdir -p $HOME/.config/nvim
ln -sf $(pwd)/init.vim $HOME/.config/nvim/init.vim
sudo ln -sf /usr/bin/nvim /usr/bin/vim

# install a plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
vim +PlugInstall +:q
vim +UpdateRemotePlugins +:q

# install language servers
# https://github.com/cquery-project/cquery
# https://github.com/palantir/python-language-server
