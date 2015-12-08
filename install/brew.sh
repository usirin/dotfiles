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
brew install macvim --override-system-vim --with-cscope --with-lua
brew linkapps macvim
brew install reattach-to-user-namespace
brew install tmux

brew install node
brew install golang
brew install python

brew install boot2docker
brew install mongodb
brew install nginx
brew install postgresql

exit 0
