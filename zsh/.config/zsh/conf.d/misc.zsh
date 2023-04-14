#
# misc - Set general Zsh config options here, or change plugin settings.
#

#
# Options
#
## History
export HISTFILE=~/.zsh_history
export HISTFILESIZE=50000
export HISTSIZE=50000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
# setopt HIST_BEEP              # Beep when accessing non-existent history.


# Undo options from plugins
setopt NO_BEEP       # Be quiet!
setopt NO_HIST_BEEP  # Be quiet!

#
# OMZ
#

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/magic-enter
if [[ "$OSTYPE" == darwin* ]]; then
  MAGIC_ENTER_OTHER_COMMAND='ls -G'
else
  MAGIC_ENTER_OTHER_COMMAND='ls --color=auto'
fi
MAGIC_ENTER_GIT_COMMAND="$MAGIC_ENTER_OTHER_COMMAND && git status -sb"

#
# Zsh-Utils
#

# The belek/zsh-utils completion plugin also introduces compstyles. Let's use that!
(( ! $+functions[compstyle_zshzoo_setup] )) || compstyle_zshzoo_setup

#
# Z
#

ZSHZ_DATA=${XDG_DATA_HOME:=$HOME/.local/share}/z/data
