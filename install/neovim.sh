#!/bin/bash

echo "Neovim setup"

NEOVIM_CONF_FOLDER=$DOTFILES/nvim
NEOVIM_TARGET=$HOME/.config/nvim

TEMP_FOLDER=/tmp

echo "neovim: creating symlink from $NEOVIM_CONF_FOLDER to $NEOVIM_TARGET"
mkdir -p $NEOVIM_TARGET
ln -sf $NEOVIM_CONF_FOLDER/init.vim $NEOVIM_TARGET/init.vim

echo "neovim: installing dein.vim to $NEOVIM_TARGET"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $TEMP_FOLDER/installer.sh
sh $TEMP_FOLDER/installer.sh $NEOVIM_TARGET/dein

echo "neovim: add support for python3"
pip3 install neovim
pip3 install --upgrade neovim

