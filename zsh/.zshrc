# initialize direnv
eval $(thefuck --alias)
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


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="agnoster"
#ZSH_THEME="random"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm.dd.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf ufw git git-extras aws zsh-aws-vault ssh-agent aws-mfa docker fzf-tab zsh-syntax-highlighting colorize terraform git-extras)

setopt globdots
source $ZSH/oh-my-zsh.sh


# User configuration

source $ZSH_CUSTOM/aliases.zsh
[ -f $ZSH_CUSTOM/kubectl_aliases.zsh ] && source $ZSH_CUSTOM/kubectl_aliases.zsh

#export TERM=screen-256color

#export FZF_ALT_C_COMMAND="fd -t d . $HOME"
# export the qt theme
#export QT_QPA_PLATFORMTHEME=gtk2
# Autoload zsh zsh-add-hook
autoload -U add-zsh-hook

autoload -U compinit && compinit //override comp

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
# disable sort when completing `git checkout`
#zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ /usr/bin/kubectl ]] && source <(kubectl completion zsh)

# Created by `pipx` on 2022-03-04 07:36:39
export PATH="$PATH:/home/jcrean/.local/bin:/snap/bin"
