# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

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

[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Set the name of the static .zsh plugins file antidote will generate.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt

# Lazy-load antidote.
fpath+=(${ZDOTDIR:-~}/.antidote/functions)
autoload -Uz $fpath[-1]/antidote

# Generate static file in a subshell when .zsh_plugins.txt is updated.
if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
  (antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins)
fi


OTHERZSHCONFIG=$(fd --glob '*.zsh' --exclude 'init.sh' ${ZDOTDIR}/conf.d/)
FILES=($(echo $OTHERZSHCONFIG | tr '\n' ' '))

for FILE in $FILES; do
  source $FILE
done

# Source your static plugins file.
source $zsh_plugins
autoload -Uz compinit && compinit

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

if [[ ${TERM_PROGRAM} == "WezTerm" ]] || source ~/.config/wezterm/wezterm-shell-intergration.sh
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.

# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh