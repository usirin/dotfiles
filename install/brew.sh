#!/bin/bash

# install Homebrew if it's not already installed
if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

brew install zsh

brew install ag
brew install ack
brew install tree
brew install wget
brew install z
brew install cmake
brew install tig

brew install git
brew install hub
brew install reattach-to-user-namespace
brew install tmux
brew install unrar

brew install node
brew install golang
brew install python

brew install gnupg

echo "installing neovim..."
brew tap neovim/neovim
brew install --HEAD neovim

brew install gpg-agent
brew install gnupg
