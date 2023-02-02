
export PATH="$PATH:$HOME/bin:$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/bin:$PATH:$HOME/.local/bin"

# Created by `pipx` on 2022-03-04 07:36:39
export PATH="$PATH:$HOME/.local/bin:/snap/bin:$HOME/bin"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
SHARE_HISTORY=""
HIST_STAMPS="yyyy.mm.dd"
DIRSTACKSIZE=20

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

# Let Zplug manage itself
[[ -d ~/.zplug ]] || {
  curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
  source ~/.zplug/zplug
  zplug update --self
}

source ~/.zplug/init.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Wezterm pane vim navigation with wezterm.nvim
[ -n "$WEZTERM_PANE" ] && export NVIM_LISTEN_ADDRESS="/tmp/nvim$WEZTERM_PANE"

# Source other zsh configs

OTHERZSHCONFIG=$(fd --glob '*.sh' --exclude 'init.sh' $HOME/.zshrc.d/)
FILES=($(echo $OTHERZSHCONFIG | tr '\n' ' '))

for FILE in $FILES; do
  source $FILE
done

#source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Zplug zsh plugins
zplug "apachler/zsh-aws", as:plugin
zplug 'wfxr/forgit', as:plugin
zplug 'NullSense/fuzzy-sys', as:plugin
zplug "kalsowerus/zsh-bitwarden"
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "eastokes/aws-plugin-zsh", as:plugin
zplug "ajeetdsouza/zoxide", as:plugin

zplug "junegunn/fzf", as:plugin
zplug "Aloxaf/fzf-tab", as:plugin
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "unixorn/fzf-zsh-plugin", as:plugin, from:github
zplug "unixorn/fzf-zsh-plugin", as:plugin
zplug "softmoth/zsh-vim-mode", from:github

autoload -U colors && colors

autoload -U add-zsh-hook

#COMPLETION_WAITING_DOTS="false"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=true

#autoload -U compinit && compinit //override comp
autoload -Uz url-quote-magic

autoload -Uz compinit; compinit; _comp_options+=(globdots);

zle -N self-insert url-quote-magic

# lazy load custome functions, keep at bottom
fpath=( $HOME/.zshrc.d/zsh_functions/ "${fpath[@]}" )
autoload -Uz $fpath[1]/*(.:t)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zplug load
source ~/.config/wezterm/wezterm-shell-intergration.sh
