# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# .zshrc - Zsh file loaded on interactive shell sessions.
#

## History
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

#
# Profiling
#
alias vim="nvim"

# Load zprof first if we need to profile.
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

#
# Options
#

# Set general Zsh options needed for config.
setopt extended_glob
autoload -Uz compinit
compinit

#
# Lazy-load functions
#

# Autoload functions directory and its subdirs.
for funcdir in $ZDOTDIR/functions $ZDOTDIR/functions/*(N/); do
  fpath=($funcdir $fpath)
  autoload -Uz $fpath[1]/*(.:t)
done
unset funcdir

# Load conf.d directory
for confdir in $ZDOTDIR/conf.d $ZDOTDIR/conf.d/*(N/); do
  fpath=($confdir $fpath)
  autoload -Uz $fpath[1]/*(.:t)
done
unset confdir

#
# Pre-antidote
#

# Be sure to set any supplemental completions directories before compinit is run.
fpath=(${ZDOTDIR}/completions(-/FN) $fpath)

# Source .zpreztorc
[[ -f $ZDOTDIR/.zpreztorc ]] && . $ZDOTDIR/.zpreztorc

#
# antidote
#

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt

#[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
#  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote
#
## Set the name of the static .zsh plugins file antidote will generate.
#zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh
#
## Ensure you have a .zsh_plugins.txt file where you can add plugins.
#[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt
#
## Lazy-load antidote.
#fpath+=(${ZDOTDIR:-~}/.antidote/functions)
#autoload -Uz $fpath[-1]/antidote
#
## Generate static file in a subshell when .zsh_plugins.txt is updated.
#if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
#  (antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins)
#fi


#OTHERZSHCONFIG=$(fd --glob '*.zsh' --exclude 'init.sh' ${ZDOTDIR}/conf.d/)
#FILES=($(echo $OTHERZSHCONFIG | tr '\n' ' '))
#
#for FILE in $FILES; do
#  source $FILE
#done

# Source your static plugins file.
# source $zsh_plugins
#autoload -Uz compinit && compinit


if [[ ${TERM_PROGRAM} == "WezTerm" ]];then
    source ${HOME}/.config/wezterm/wezterm-shell-intergration.sh
fi
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.

# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
#if [[ ! -f ${ZDOTDIR}/.p10k.zsh ]]
#then
#  source ${ZDOTDIR}/.p10k.zsh
#fi

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
