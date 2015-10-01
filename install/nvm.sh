#!/bin/bash

if test ! $(which nvm); then
    echo "Installing nvm"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
fi

# reload nvm into this environment
source $(brew --prefix nvm)/nvm.sh

"Installing node v0.10"
nvm install 0.10
nvm use 0.10


