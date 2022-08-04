# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HIST_STAMPS="mm.dd.yyyy"
OTHERZSHCONFIG="$HOME/.zshrc.d/"
DIRSTACKSIZE=15

# Zplug manage it's self
[[ -d ~/.zplug ]] || {
  curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
  source ~/.zplug/zplug
  zplug update --self
}

source ~/.zplug/init.zsh

# Zplug zsh plugins
zplug "zsh-users/zsh-completions"
#zplug "zsh-users/zsh-autosuggestions"
zplug "pookey/zsh-aws-plugin"
zplug "apachler/zsh-aws"
zplug "kalsowerus/zsh-bitwarden"
zplug "romkatv/powerlevel10k", as:theme, depth:1
#zplug "modules/git", from:"prezto"
zplug "eastokes/aws-plugin-zsh"
# zplug "skywind3000/z.lua"
zplug "ajeetdsouza/zoxide", use:zoxide.plugin.zsh
zplug "junegunn/fzf", use:"shell/*.zsh"
zplug "Aloxaf/fzf-tab"
zplug "unixorn/fzf-zsh-plugin"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# enhanced zsh vim mode
zplug "softmoth/zsh-vim-mode", from:github

# Created by `pipx` on 2022-03-04 07:36:39
export PATH="$PATH:/home/jcrean/.local/bin:/snap/bin"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load more zsh configs alias and functions
if [[ -d "$OTHERZSHCONFIG" ]]; then
  for file in "$OTHERZSHCONFIG"*.zsh; do
    source "$file"
  done
fi

zplug load 

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
