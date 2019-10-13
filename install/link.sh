#!/bin/bash

DOTFILES=$HOME/dotfiles

echo "creating symlinks"
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
    rm -rf $target
    echo "☠️  $file"
    
    ln -sf $file $target
    echo "✅ $file → $target"
done
