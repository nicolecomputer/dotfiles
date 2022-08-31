#!/bin/bash

# Installs dotfiles

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

safe_link(){
    local src="$1"
    local dest="$HOME/`basename $src`"
    [ ! -e "$dest" ] && ln -sf "$src" "$dest"
}

# Get root
SCRIPT_PATH=`realpath $0`
DOTFILES=`dirname $SCRIPT_PATH`

# Install bin scripts
safe_link "$DOTFILES/bin"
# Install other dotfiles
for f in `ls -A $DOTFILES/dotfiles`; do
    safe_link "$DOTFILES/dotfiles/$f"
done
