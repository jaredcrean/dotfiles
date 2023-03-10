eval "$(zoxide init zsh)"
export PLASMA_USE_QT_SCALING=1
# Better Firefox scrolling among others
export MOZ_USE_XINPUT2=1
export BROWSER=/usr/bin/firefox-developer-edition

export FORGIT_COPY_CMD='xclip -selection clipboard'

# Pacman Tweaks and speed up

# use as many cores as possible for file  compressing 
export COMPRESSZST=(zstd -c -z -q --threads=0 -)
export COMPRESSXZ=(xz -c -z --threads=0 -)
export COMPRESSGZ=(pigz -c -f -n)
export COMPRESSBZ2=(pbzip2 -c -f)

# Laptop graphics Tweaks
export VGL_READBACK=pbo
