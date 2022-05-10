
# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='neovide'
#else
#  export EDITOR='mvim'
#fi

export EDITOR='neovide'
#export XDG_CONFIG_HOME='$HOME/.config'
#export XDG_CONFIG_DIRS='/etc/xdg/'

#Setup FZF to default to Home Directory
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# Force firefox to use EGL which is faster
MOZ_X11_EGL=1
# Enable Pixel-perfect trackpad scrolling for firefox
MOZ_USE_XINPUT2=1

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelat

### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

