#!/bin/bash

echo "Adding extra apt-get repositories"
sudo add-apt-repository ppa:neovim-ppa/unstable

echo "Updating apt-get"

sudo apt-get update

echo "Installing apt-get packages..."

sudo apt-get install zsh

sudo apt-get install silversearcher-ag
sudo apt-get install ack-grep
sudo apt-get install tree
sudo apt-get install cmake

sudo apt-get install tig
sudo apt-get install git
sudo apt-get install tmux

sudo apt-get install neovim

sudo apt-get install python3-pip


