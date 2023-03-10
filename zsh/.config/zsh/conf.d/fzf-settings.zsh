#!/bin/zsh

# Gruvbox theme for fzf
export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'
#export FZF_DEFAULT_OPTS='--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'


#export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZ_HISTORY_CD_CMD="zoxide"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_PREVIEW_ADVANCED=true
export LESSOPEN='| lessfilter-fzf %s'

my-fzf-tab() {
  functions[compadd]=$functions[-ftb-compadd]
  zle fzf-tab-complete
}
zle -N my-fzf-tab
bindkey "^I" my-fzf-tab

# Themes
#export FZF_DEFAULT_OPTS='--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

# or for everything
zstyle ':completion:*' fzf-search-display true

# Show systemctl servies in FZF
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
#zstyle ':fzf-tab:complete:ps:*' fzf-tab 'ps -ef '

# Accetps selection with space
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'

zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'

# use input as query string when completing zlua
#zstyle ':fzf-tab:complete:_zlua:*' query-string input

#zstyle ':fzf-tab:complete:ps:*' query-string input

# env Vars
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'

zstyle ':fzf-tab:complete:*:*' fzf-preview '/usr/bin/bat -plman --color=always ${(Q)realpath}|head --lines 500'

# Better git completions in FZF
# preview a `git status` when completing git add
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
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with lsd when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --all --color=always $realpath'

#zstyle ':fzf-tab:complete:*' fzf-preview 'exa -1 --tree --level 2 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

 _fzf_comprun() {
   local command=$1
   shift

  case "$command" in
    cd)           fzf "$@" --preview 'lsd --color --icon -1 {} | head -200' ;;
    ps)           fzf "$@" --preview 'ps -ef {} | head -200' ;;
    *)            fzf "$@" ;;
  esac
}

 # Use fd (https://github.com/sharkdp/fd) instead of the default find
 # command for listing path candidates.
 # - The first argument to the function ($1) is the base path to start traversal
 # - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

## Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
