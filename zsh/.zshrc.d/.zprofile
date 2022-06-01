# Created by `pipx` on 2022-03-04 07:36:39
export PATH="$PATH:/home/jcrean/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/home/jcrean/.local/bin:/snap/bin"
export GOPATH="$HOME/go"


# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='neovide'
#else
#  export EDITOR='nvim'
#fi

export EDITOR='nvim'
#export XDG_CONFIG_HOME='$HOME/.config'
#export XDG_CONFIG_DIRS='/etc/xdg/'

# export SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/ssh-agent.socket

# Export the qt theme
#export QT_QPA_PLATFORMTHEME=gtk2
# GDK scaling settings for HiDpi
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5


#Setup FZF to default to Home Directory
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

### Firefox Settings
# Force firefox to use EGL which is faster
export BROWSER='/usr/bin/firefox' 
export MOZ_X11_EGL=1
# Enable Pixel-perfect trackpad scrolling for firefox
export MOZ_USE_XINPUT2=1

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### Better less for use with fzf
export LESSOPEN='| lessfilter-fzf %s'

### FZF settings
export FZF_PREVIEW_ADVANCED=true
