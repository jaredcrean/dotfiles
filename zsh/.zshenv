#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# You can use .zprofile to set environment vars for non-login, non-interactive shells.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Firefox Setup
export MOZ_DRM_DEVICE=/dev/dri/renderD128
export MOZ_USE_XINPUT2=1
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

# Flatpak Desktop Setup
export PATH="$PATH:/var/lib/flatpak/exports/share:/home/jcrean/.local/share/flatpak/exports/share"
