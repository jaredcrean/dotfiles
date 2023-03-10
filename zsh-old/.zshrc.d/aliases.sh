alias reload="source ~/.zshrc"

alias cdw='cd $HOME/gitrepos/work/'
alias cdd='cd $HOME/.dotfiles'
alias cdr='cd $HOME/gitrepos/'
alias cdz='cd /nfs/zshare/'

alias vim="nvim"
alias htop="btop"
alias rm='rm -i'
alias mv='mv -i'
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

# Pacman and paru
alias pacs='pacman --color always -Sl | sed -e "s: :/:; /installed/d" | cut -f 1 -d " " | fzf --multi --ansi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias pars='paru --color always -Sl | sed -e "s: :/:; s/ unknown-version//; /installed/d" | fzf --multi --ansi --preview "paru -Si {1}" | xargs -ro paru -S'
alias pacr="pacman --color always -Q | cut -f 1 -d ' ' | fzf --multi --ansi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"


# Better ls
alias ls='exa --icons --long --git'
alias la='exa -a --icons --long --git'
alias l='exa --icons --git --grid'


##### Git alias
alias gcam='git commit -a -m'
alias gis='git status'
alias gp='git push'

# Git Worktree's
alias gwl='git worktree list'
alias gwa='git worktree add'
alias gwr='git worktree remove'

# Terraform
alias tfp='terraform plan'
alias tfi='terraform init'
alias tfv='terraform validate'
alias tff='terraform format'

# Remove vim swp files
alias rmvs='~/.local/share/nvim/swap/*.s[a-z]p'

# List the directories in tree format and take an argument for the depth level
lst() {
   if [[ $# -gt 0 ]]
   then
     exa --icons --tree --level=$1 --long
   elif [[ $# -eq 0 ]]
   then
     exa --icons --tree --level=1 --long
     echo "### Add a number to show deeper directories example: lst 3"
   fi
}

eval "$(thefuck --alias fu)"
