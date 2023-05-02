
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_PATH='/usr/local/bin/fzf'
# Setup fzf
# ---------
#if [[ ! "$PATH" == */usr/local/bin* ]]; then
#  PATH="${PATH:+${PATH}:}/usr/bin/fzf"
#fi
#
## Auto-completion
## ---------------
# [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
# source /usr/local/opt/fzf/shell/completion.zsh 2> /dev/null
#
## Key bindings
## ------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Themes
## Groovebox
#export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'
# tomasr/molokai
export FZF_DEFAULT_OPTS='--color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'
## Drcula
# export FZF_DEFAULT_OPTS='--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
#export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZ_HISTORY_CD_CMD="zoxide"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_PREVIEW_ADVANCED=true

#Lessfilter and lesspipe
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|${ZDOTDIR}/.lessfilter %s'


# fzf forgit zsh plugin
export FORGIT_FZF_DEFAULT_OPTS=" --exact --border --cycle --reverse --height '80%' "

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
#export FZF_CTRL_R_OPTS="
#  --preview 'echo {}' --preview-window up:3:hidden:wrap
#  --bind 'ctrl-/:toggle-preview'
#  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#  --color header:italic
#  --header 'Press CTRL-Y to copy command into clipboard'"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

## Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

#my-fzf-tab() {
#  functions[compadd]=$functions[-ftb-compadd]
#  zle fzf-tab-complete
#}

# zle -N my-fzf-tab
#bindkey "^I" my-fzf-tab
#_fzf_comprun() {
#   local command=$1
#   shift
#
#  case "$command" in
#    cd)           fzf "$@" --preview 'lsd --color --icon -1 {} | head -200' ;;
#    ps)           fzf "$@" --preview 'ps -ef {} | head -200' ;;
#    *)            fzf "$@" ;;
#  esac
#}


zstyle ':completion:*' fzf-search-display true
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'

#zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat -plman --color=always ${(Q)realpath}|head --lines 500'

zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'

zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --all --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'
zstyle ':fzf-tab:complete:-command-:*' fzf-preview \
  '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'
# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
# Systemd
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
# Man pages
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
