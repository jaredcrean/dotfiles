#!/bin/bash

stow --verbose --target="$HOME" tmux
stow --verbose --target="$HOME" neovim
stow --verbose --target="$HOME" zsh
stow --verbose --target="$HOME" bash
stow --verbose --target="$HOME" i3
stow --verbose --target="$HOME" wezterm
#stow --verbose --target="$HOME" polybar-collection
stow --verbose --target="$HOME" picom
#echo "1" > ./polybar-themes/setup.sh --material
#stow --verbose --target=$HOME i3

# TODO: Create Install Script 
# case "$DESKORLAP" in
#   -d) echo 1
#   ;;
#   -l) echo 2 or 3
#   ;;
#   *) echo "Choose to install on Laptop or Desktop"
#   ;;
# esac


