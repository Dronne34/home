
# typeset -U path PATH
# path=(~/.local/bin $path)
# export PATH
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi