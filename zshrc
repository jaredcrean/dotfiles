# Path to your oh-my-zsh installation.
#
export ZSH=/home/jcrean/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
ZSH_THEME="sonicradish"
#ZSH_THEME="jonathan"
#ZSH_THEME="fino"
#ZSH_THEME="bullet"
#ZSH_THEME="agnoster"
#ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=40000
HISTFILE=~/.zsh_history
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose powerline archlinux zsh-syntax-highlighting colored-man-pages zsh-history-substring-search nyan python battery)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
#PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

export EDITOR='vim'

export BROWSER='chromium'

export TERM='xterm-256color'

#set up python shell
export PYTHONSTARTUP=~/.pythonrc

#functions

#Test if a port is open on remote machine.

function test-port() {
(echo > /dev/tcp/$1/$2) >/dev/null 2>&1 && echo 'Its open' || echo 'Its Down!'
 }



alias vi="vim"

alias vrls="virsh list --all"

alias acdcli="acdcli --color always"

#Sort file in dir by bigest
alias biggest='find -type f -printf '\''%s %p\n'\'' | sort -nr | head -n 40 | gawk "{ print \$1/1000000 \" \" \$2 \" \" \$3 \" \" \$4 \" \" \$5 \" \" \$6 \" \" \$7 \" \" \$8 \" \" \$9 }"'

alias json='python -mjson.tool'
alias file-size='du -k|sort -rn|head -50'
alias ipmi-connect='ipmitool -I lanplus -H $1 -U ADMIN -P ADMIN sol activate'
alias h="history"
#alias IRC="python2 /home/jcrean/Nextcloud/programming-scripts/python/pyrnotify/pyrnotify.py 4321 & ssh -R 4321:localhost:4321 tmux attach"
alias IRC="ssh -C 192.168.1.169 -t tmux a"
alias reload="source ~/.zshrc"
alias vimwiki='vim -c VimwikiIndex'
alias todo='vim -c To-Do'
alias ssh='TERM=xterm ssh'
alias dual-mon='xrandr --output DP2 --mode 2560x1440 --dpi 100 --rotate left --left-of DP1 --rotate normal;xrandr --output DP1 --mode 3840x2160 --dpi 125 --primary;xrandr --output eDP1 --off'

alias laptop-mon='xrandr --output eDP1 --mode 3840x2160 --dpi 180 --primary ;xrandr --output DP1 --off; xrandr --output DP2 --off'

alias single-mon='xrandr --output DP1 --mode 3840x2160 --dpi 125 --primary;xrandr --output eDP1 --off; xrandr --output DP2 --off'

alias calulator='/usr/sbin/speedcrunch'
alias pulse-vpn='sudo openconnect --servercert=sha1:8fde39f3bf2d772cb7f1f2339e86387ff12992bb --authgroup="single-Factor Pulse Clients" --protocol=nc $1/dana-na/auth/url_6/welcome.cgi --pid-file="/var/run/work-vpn.pid" --user=$2  -b'
alias dl360-ilo='sshpass -p $(echo "") ssh -o StrictHostKeyChecking=no admin@$1'


#random quote
#quote
#
