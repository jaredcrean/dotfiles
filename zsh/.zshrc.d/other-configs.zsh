eval "$(zoxide init zsh)"

autoload -U colors && colors

#COMPLETION_WAITING_DOTS="false"

setopt globdots

##typeset -g POWERLEVEL9K_INSTANT_PROMPT=true
#
## Autoload zsh zsh-add-hook
autoload -U add-zsh-hook
#
## autoload -U compinit && compinit //override comp
autoload -Uz url-quote-magic

autoload -Uz compinit; compinit; _comp_options+=(globdots);
#
zle -N self-insert url-quote-magic
