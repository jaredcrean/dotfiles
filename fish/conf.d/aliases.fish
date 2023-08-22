#!/bin/fish
#
# abbres - Set whatever Zsh abbres you want.
#

# suffix abbres (ie: `cd ..4`)
#abbr -g ..2 '../..'
#abbr -g ..3 '../../..'
#abbr -g ..4 '../../../..'
#abbr -g ..5 '../../../../..'
#abbr -g ..6 '../../../../../..'
#abbr -g ..7 '../../../../../../..'
#abbr -g ..8 '../../../../../../../..'
#abbr -g ..9 '../../../../../../../../..'

# single character abbres - be sparing!
# abbr _ sudo
# abbr l 'exa --grid --color auto --icons'
abbr g 'git'

# mask built-ins with better defaults
abbr vi 'nvim'
abbr vim 'nvim'

# more ways to ls
# abbr ls "exa --all -1 --color auto --icons"
# abbr -g ls "exa -1 --color auto --icons"
abbr h 'fzf-history-widget'

# Copy stdin to system clipboard
abbr copy 'xclip -selection clipboard'

# fix common typos
abbr quit 'exit'
# abbr cd.. 'cd ..'
# abbr cd 'z'

# tar
abbr tarls "tar -tvf"
abbr untar "tar -xf"

# Run with Nvidia GPU

abbr ngpu '__NV_PRIME_RENDER_OFFLOAD 1 __VK_LAYER_NV_optimus NVIDIA_only __GLX_VENDOR_LIBRARY_NAME nvidia'


# url encode/decode
abbr urldecode 'python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
abbr urlencode 'python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'

# misc
abbr please 'sudo'

# abbr zshrc '${EDITOR:-nvim} "${ZDOTDIR:-$HOME}"/.zshrc'
# abbr zbench 'for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
# abbr zdot 'cd ${ZDOTDIR:-~}'

# abbr reload "source ~/.zshrc"
#
abbr cdd "cd $HOME/dotfiles"
abbr cdr "cd $HOME/repos/"
abbr cdz 'cd /nfs/zshare/'

abbr vim "nvim"
abbr htop "btop"
#abbr rm 'rm -i'
abbr mv 'mv -i'
#abbr cp 'cp -i'

# abbr up-joplin 'wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh'
# abbr up-joplin-pre 'wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh'
abbr vim-abbr 'nvim ~/.config.d/fish/abbres.fish'
# AWS set profile
#abbr asp "asp"

# AWS get profile
# abbr agp "agp"

# Make clip put selection in clipboard rather then middle mouse click
# abbr xclip "xclip -selection clipboard"

# abbr reload "omz reload"

abbr cat "bat --theme Dracula"

## Colors
abbr diff 'diff --color'
#abbr grep 'grep --color'
#abbr ip 'ip -color auto'
#abbr yay 'paru'

# Pacman and yay
## Search 
abbr pacs 'yay --color always -Sl | sed -e "s: :/:; /installed/d" | cut -f 1 -d " " | fzf --multi --ansi --preview "yay -Si {1}" | xargs -ro sudo yay -S'
## list all packages in a repository
#abbr pars "yay --color always -Sl | sed -e "s: :/:; s/ unknown-version//; /installed/d" | fzf --multi --ansi --preview "yay -Si {1}" | xargs -ro yay -S"
## Search installed packages
abbr pacr "yay --color always -Q | cut -f 1 -d ' ' | fzf --multi --ansi --preview 'yay -Qi {1}' | xargs -ro sudo yay -Rns"
## list install packages and search
abbr paci "yay -Qq | fzf --preview 'yay -Qil {}' --layout reverse --bind 'enter:execute(yay -Qil {} | less)'"
## Search packages in repo and AUR
abbr pacb "yay -Slq | fzf --preview 'yay -Si {}' --layout reverse"
## Remove pacman package
abbr rmpkg "sudo pacman -Rsn"
## Clean pacman Cache
abbr cleanch "sudo pacman -Scc"
## Remove pacman db.lck
abbr fixpacman "sudo rm /var/lib/pacman/db.lck"

# Help people new to Arch
abbr apt "man pacman"
abbr apt-get "man pacman"
abbr please "sudo"
abbr tb "nc termbin.com 9999"

# Cleanup orphaned packages
abbr cleanup "sudo pacman -Rsn (pacman -Qtdq)"


# Get the error messages from journalctl
abbr jctl "journalctl -p 3 -xb"

# Recent installed packages
abbr rip "expac --timefmt '%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"


# Better ls
abbr ls 'exa --icons --long --git'
abbr la 'exa -a --icons --long --git'
abbr l 'exa --icons --git --grid'


##### Git abbr
abbr gcam 'git commit -a -m'
abbr gis 'git status'
abbr gp 'git push'

### Forgit abbr to change we have to export them as vars
# set forgit_log glo
# set forgit_diff gd
# set forgit_add ga
# set forgit_reset_head grh
# set forgit_ignore gi
# set forgit_checkout_file gcf
# set forgit_checkout_branch gcb
# set forgit_branch_delete gbd
# set forgit_checkout_tag gct
# set forgit_checkout_commit gco
# set forgit_revert_commit grc
# set forgit_clean gclean
# set forgit_stash_show gss
# set forgit_stash_push gsp
# set forgit_cherry_pick gcp
# set forgit_rebase grb
# set forgit_blame gbl
# set forgit_fixup gfu

# Git Worktree's
abbr gwl 'git worktree list'
abbr gwa 'git worktree add'
abbr gwr 'git worktree remove'

# Terraform
abbr tfp 'terraform plan'
abbr tfi 'terraform init'
abbr tfv 'terraform validate'
abbr tff 'terraform format'

# Remove vim swp files
abbr rmvs '~/.local/share/nvim/swap/*.s[a-z]p'

# List the directories in tree format and take an argument for the depth level
#function lst
#   if count $argv -gt 0
#     exa --icons --tree --level $1 --long
#   else if  count $argv -eq 0 
#     exa --icons --tree --level 1 --long
#     echo "### Add a number to show deeper directories example: lst 3"
#   end
#end
