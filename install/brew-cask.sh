#!/bin/bash

# install Homebrew if it's not already installed
if test ! $(which brew-cask); then
    echo "Installing homebrew-cask"
    brew install caskroom/cask/brew-cask
fi

# tap `versions` repo to get alternate versions.
brew tap caskroom/versions

echo "Installing homebrew-cask packages..."

brew cask install virtualbox
brew cask install google-chrome
brew cask install google-drive
brew cask install sublime-text
brew cask install slack
brew cask install 1password
brew cask install moom
brew cask install spotify

