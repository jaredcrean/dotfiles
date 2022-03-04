#!/bin/bash

## Move old dotfile to bakup dir ##

FILES = "zshrc vimrc bashrc tmux"
OLDDIR = ~/old_dotfiles
NEWDIR = "~/dotfiles"


mkdir -p ~/$OLDDIR
mkdir -p ~/$DOTFILES

cd $NEWDIR

for file in $FILES; do
    echo "Move old files to $OLDDIR"
    mv ~/.$file ~/$OLDDIR
    echo "Link new files to $NEWDIR/$file"
    ln -sf $NEWDIR/$files ~/.$file
done

ln -s ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
