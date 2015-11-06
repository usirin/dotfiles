#!/bin/bash

echo "Installing dotfiles"

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then

  echo "Running on Mac OS X"

  echo ">>> homebrew"
  source install/brew.sh

  echo ">>> homebrew-cask"
  source install/brew-cask.sh
fi

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Done!"


