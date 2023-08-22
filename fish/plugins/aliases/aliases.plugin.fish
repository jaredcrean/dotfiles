#!/bin/fish
# Handle $0 according to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
# 0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
# 0="${${ZERO:-${0:#"$(status filename)"}}:-${(%):-%N}}"
#0="${${(M)0:#/*}:-$PWD/$0}"
set -l 0="(status filename)"
set -l 0="{${(M)0:#/*}:-"(pwd)""/"(status filesname)"}"

eval '
  function acs
    (( $+commands[python3] )) ||
      echo "[error] No python executable detected"
      return
    alias | python3 "'"${0:h}"'/cheatsheet.py" "$argv"

