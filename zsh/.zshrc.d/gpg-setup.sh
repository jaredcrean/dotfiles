#!/bin/bash
#Making sure we're using gpg2
alias gpg=gpg2

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
          gpg-connect-agent /bye >/dev/null 2>&1
fi

export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#gpg-connect-agent updatestartuptty /bye
#unset SSH_AGENT_PID
