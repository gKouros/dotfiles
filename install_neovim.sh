#!/bin/bash

sudo pacman -S --noconfirm neovim python-neovim python{,2} xdotool uncrustify \
pip2 install --user neovim pynvim
pip install --user neovim pynvim grip jedi \
    yapf cmake-format remark pyaml flake8 pylint
pip install --user 'msgpack>=1.0.0'
mkdir -p $HOME/.config/nvim
ln -s $(pwd)/init.vim $HOME/.config/nvim/init.vim

# install yaourt for installation of community packages
yaourt -S neovim-symlinks neovim-drop-in universal-ctags

# install a plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
vim +PlugInstall +:q +:q

# install language servers
https://github.com/cquery-project/cquery
https://github.com/palantir/python-language-server
