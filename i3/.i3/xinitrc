#!/bin/bash
#if [ -d /etc/X11/xinit/xinitrc.d ] : then
#	for f in /etc/X11/xinit/xinitrc.d*; do
#		[ -x "$f" ] && . "$f"
#	done
#	unset f
#fi
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
#exec i3
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
#exec gnome-session
exec startkde
