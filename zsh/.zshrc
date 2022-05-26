# initialize direnv
#eval $(thefuck --alias)
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Path to your oh-my-zsh installation.
export ZSH="/home/jcrean/.oh-my-zsh"

ZSH_CUSTOM="/home/jcrean/.zshrc.d"

#ZSH_THEME="agnoster"
#ZSH_THEME="random"
ZSH_THEME="powerlevel10k/powerlevel10k"

#ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="false"

HIST_STAMPS="mm.dd.yyyy"

ZSH_CUSTOM="/home/jcrean/.zshrc.d"

plugins=( aws zsh-aws-vault ssh-agent aws-mfa docker zsh-syntax-highlighting terraform fzf-tab fzf-zsh-plugin )

setopt globdots
source $ZSH/oh-my-zsh.sh

#export TERM=screen-256color

# Autoload zsh zsh-add-hook
autoload -U add-zsh-hook

# autoload -U compinit && compinit //override comp
autoload -Uz url-quote-magic

zle -N self-insert url-quote-magic


# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

zstyle ':completion:*:*:*:default' menu yes select search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ /usr/bin/kubectl ]] && source <(kubectl completion zsh)

#[[ -d ~/.zshrc.d ]] || source ~/.zshrc.d/*
# Wezterm pane vim navigation with wezterm.nvim
[ -n "$WEZTERM_PANE" ] && export NVIM_LISTEN_ADDRESS="/tmp/nvim$WEZTERM_PANE"

# Created by `pipx` on 2022-03-04 07:36:39
export PATH="$PATH:/home/jcrean/.local/bin:/snap/bin"
