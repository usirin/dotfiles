#!/bin/bash

echo "Installing dotfiles"

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then

  echo "Running on Mac OS X"

  echo ">>> homebrew"
  source install/brew.sh

  echo ">>> homebrew-cask"
  source install/brew-cask.sh

  echo ""

fi


