#!/bin/sh

# Wezterm pane vim navigation with wezterm.nvim
[ -n "$WEZTERM_PANE" ] && export NVIM_LISTEN_ADDRESS="/tmp/nvim $WEZTERM_PANE"
