#!/bin/sh

export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# Wezterm pane vim navigation with wezterm.nvim
[ -n "$WEZTERM_PANE" ] && export NVIM_LISTEN_ADDRESS="/tmp/nvim $WEZTERM_PANE"
