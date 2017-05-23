#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	    . /usr/share/bash-completion/bash_completion



alias ls='ls --color'
#alias vim='nvim'

PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"

#PS1='[\u@\h \W]\$ '

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

if [ -f /usr/bin/figlet ]; then 
    echo -e "\e[01;35m$(figlet -f epic Crean ThinkPD)\e[00m"
fi

if echo hello|grep --color=auto l >/dev/null 2>&1; then
      export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
fi
