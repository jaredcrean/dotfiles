alias reload="source ~/.zshrc"

alias cdw="cd $HOME/gitrepos/work/"
#alias cdr="cd $HOME/gitrepos/"
alias cdd="cd $HOME/.dotfiles"
alias cdr="cd $HOME/gitrepos/"

alias vim="nvim"
alias htop="btop"
#alias rm='rm -I'
#alias mv='mv -I'
alias cp='cp -i'

alias up-joplin='wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh'
alias up-joplin-pre='wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh'
alias vim-alias='vim ~/.zshrc.d/aliases.zsh'
# AWS set profile
#alias asp="asp"

# AWS get profile
alias agp="agp"

alias cdnas="cd /nfs/nas/"

# Make clip put selection in clipboard rather then middle mouse click
alias xclip="xclip -selection clipboard"

# alias reload="omz reload"

alias cat="bat"

## Colors
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias yay='paru'


# Better ls
alias ls='exa --icons --long --git'
alias lsa='exa -a --icons --long --git'


##### Git alias
alias gcam='git commit -a -m'
alias gis='git status'
alias gp='git push'

# Git Worktree's
alias gwl='git worktree list'
alias gwa='git worktree add'
alias gwr='git worktree remove'

# Remove vim swp files
alias rmvs='~/.local/share/nvim/swap/*.s[a-z]p'

# List the directories in tree format and take an argument for the depth level
function lst() {
   if [[ $# -gt 0 ]]
   then
     exa --icons --tree --level=$1 --long
   elif [[ $# -eq 0 ]]
   then
     exa --icons --tree --level=1 --long
     echo "### Add a number to show deeper directories example: lst 3"
   fi
}

eval $(thefuck --alias fu)
