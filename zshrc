export ZSH=/home/jcrean/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
#ZSH_THEME="sonicradish"
#ZSH_THEME="honukai"
#ZSH_THEME="jonathan"
#ZSH_THEME="fino"
#ZSH_THEME="bullet"
#ZSH_THEME="agnoster"
#ZSH_THEME="af-magic"
ZSH_THEME="fox"
#ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=4000
HISTFILE=~/.zsh_history

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/oh-my-zsh.sh

plugins=(git docker docker-compose powerline archlinux colored-man-pages zsh-history-substring-search python battery)
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

export EDITOR='vim'
export BROWSER='firefox'
export TERM='xterm-256color'
#set up python shell
export PYTHONSTARTUP=~/.pythonrc


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
alias ssh='TERM=xterm ssh'
alias dual-mon='xrandr --output DP2 --mode 2560x1440 --dpi 100 --rotate left --left-of DP1 --rotate normal;xrandr --output DP1 --mode 3840x2160 --dpi 125 --primary;xrandr --output eDP1 --off'
alias laptop-mon='xrandr --output eDP1 --mode 3840x2160 --dpi 180 --primary ;xrandr --output DP1 --off; xrandr --output DP2 --off'
alias single-mon='xrandr --output DP1 --mode 3840x2160 --dpi 125 --primary;xrandr --output eDP1 --off; xrandr --output DP2 --off'
alias calulator='/usr/sbin/speedcrunch'
alias pulse-vpn='sudo openconnect --servercert=sha1:8fde39f3bf2d772cb7f1f2339e86387ff12992bb --authgroup="single-Factor Pulse Clients" --protocol=nc $1/dana-na/auth/url_6/welcome.cgi --pid-file="/var/run/work-vpn.pid" --user=$2  -b'
alias dl360-ilo='sshpass -p $(echo "") ssh -o StrictHostKeyChecking=no admin@$1'
alias docker='sudo docker'

# Docker
alias dp='sudo docker ps'

#finxing paste issues and problems running for loops and back slash
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
export VAGRANT_DEFAULT_PROVIDER=virtualbox
