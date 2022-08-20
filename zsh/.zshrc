eval "$(zoxide init zsh)"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HIST_STAMPS="mm.dd.yyyy"
OTHERZSHCONFIG="$HOME/.zshrc.d/"
DIRSTACKSIZE=20

[[ -d ~/.zplug ]] || {
  curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
  source ~/.zplug/zplug
  zplug update --self
}

source ~/.zplug/init.zsh

## Zplug zsh plugins
zplug "apachler/zsh-aws", as:plugin
zplug 'wfxr/forgit'
zplug 'NullSense/fuzzy-sys'
zplug "kalsowerus/zsh-bitwarden"
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "eastokes/aws-plugin-zsh", as:plugin
# zplug "skywind3000/z.lua"
zplug "ajeetdsouza/zoxide", use:zoxide.plugin.zsh
zplug "junegunn/fzf", use:"shell/*.zsh"
zplug "Aloxaf/fzf-tab"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "unixorn/fzf-zsh-plugin", as:plugin
zplug "softmoth/zsh-vim-mode", from:github

autoload -U colors && colors


autoload -U add-zsh-hook

#COMPLETION_WAITING_DOTS="false"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=true

#autoload -U compinit && compinit //override comp
autoload -Uz url-quote-magic

#autoload -Uz compinit; compinit; _comp_options+=(globdots);

zle -N self-insert url-quote-magic

# Wezterm pane vim navigation with wezterm.nvim
[ -n "$WEZTERM_PANE" ] && export NVIM_LISTEN_ADDRESS="/tmp/nvim$WEZTERM_PANE"

# Created by `pipx` on 2022-03-04 07:36:39
export PATH="$PATH:/home/jcrean/.local/bin:/snap/bin"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

# Source other zsh configs
for file in "$OTHERZSHCONFIG"*.zsh; do
  source "$file"
done

# lazy load custome functions, keep at bottom
fpath=( ~/.zshrc.d/zsh_functions "${fpath[@]}" )
autoload -Uz $fpath[1]/*(.:t)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
