

fish_add_path -p /var/lib/flatpak/exports/share /home/jcrean/.local/share/flatpak/exports/share

set -gx EDITOR "/usr/bin/nvim"
# Source Alias File
source $XDG_HOME_CONFIG/fish/aliases.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if [ -f $HOME/.config/fish/cachyos-config.fish ]
    source $HOME/.config/fish/cachyos-config.fish
end

set -U fish_key_bindings fish_vi_key_bindings
