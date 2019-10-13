#!/bin/bash

echo "Installing dotfiles"

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then

  echo "Running on Mac OS X"

  echo ">>> homebrew"
  source install/brew.sh

else
  echo "Running on Ubuntu"

  echo ">>> apt-get"
  source install/apt-get.sh
fi

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing Powerline Fonts"
git clone https://github.com/powerline/fonts.git /tmp/powerline-fonts
/tmp/powerline-fonts/install.sh

echo "Installing Neovim extras"
sh install/neovim.sh

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done!"

