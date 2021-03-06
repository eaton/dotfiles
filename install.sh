#!/bin/bash

# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

DOTFILES=`cd $(dirname $0); pwd`

for FILE in $DOTFILES/*; do
    NAME=`basename $FILE`
    if [ $NAME == 'bin' ]; then
        TARGET=$HOME/bin
    else
        TARGET=$HOME/$NAME
    fi

    if [ $NAME == 'install.sh' ]; then
         # Nothin'
    elif [ $NAME == 'README.md' ]; then
         # Nothin'
    elif [ -L $TARGET ]; then
         echo "$TARGET exists"
    else
         ln -vsf $FILE $TARGET
    fi
done
