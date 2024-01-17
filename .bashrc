

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
TRANSMISSION_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/transmission-daemon"
HISTIGNORE="ls:ll:cd:pwd:bg:fg:history"
PROMPT_COMMAND="history -a; history -n"
HISTCONTROL=ignoreboth
COLORTERM=truecolor
TERMINAL=xterm
EDITOR=vim
TERM=st

export TERMINAL=xterm
export EDITOR=vim
export TERM=st
# append to the history file, don't overwrite it
shopt -s histappend
shopt -s cdspell
alias exit='pwd > ~/.lwd && exit;'
test -f ~/.lwd && export OLDPWD='head -1 ~/.lwd'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000:
HISTFILESIZE=20000
HISTTIMEFORMAT="%d/%m/%y %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PS1="\[$(tput setaf 38)\]\u\[$(tput setaf 76)\]@\[$(tput setaf 11)\]\h \[$(tput setaf 199)\]\w \[$(tput sgr0)\]$ "
export PS1="\[\e[38;5;29m\]\u\[\e[38;5;76m\]@\[\e[38;5;11m\]\h \[\e[38;5;29m\]\w \[\033[0m\]$ "
export QT_STYLE_OVERRIDE=kvantum

export WWW_HOME=https://duckduckgo.com/
export LYNX_CFG=~/.config/lynx/lynx.cfg
export LSS=~/.config/lynx/lynx.lss
#EDITOR=nano;
# export QT_QPA_PLATFORMTHEME=qt5ct;
# export PAGER="most"
export VISUAL=vim;
export HISTTIMEFORMAT="%F %T"
export _JAVA_AWT_WM_NONREPARENTING=1;
# export MANPAGER="less -R --use-color -Dd+g -Du+b"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# man 2 select
export MANROFFOPT="-P -c"
export LD_LIBRARY_PATH=/usr/local/lib

export XMONAD_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/xmonad" # xmonad.hs is expected to stay here
export XMONAD_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/xmonad"
export XMONAD_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/xmonad"


[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null
# export PATH=/bin/lscript:/bin/lscript:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### COUNTDOWN   

cdown () {
    N=$1
  while [[ $((--N)) >  0 ]]
    do
        echo "$N" |  figlet -c | lolcat &&  sleep 1
    done
}


# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
export LESS_TERMCAP_mb=$'\e[1;33m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'
  ### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# export THEME_HISTFILE=~/.theme_history
# [ -e "$THEME_HISTFILE" ] && ~/.local/shell/theme "$(~/.local/shell/theme -l|tail -n1)"



export SUDO_PROMPT="PROCEED WITH CAUTION...PASSWORD: "
#unset SUDO_PROMPT

case ${TERM} in

  st*|xterm*|rxvt*|Eterm|alacritty*|aterm|kterm|gnome*)
     PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

shopt -s expand_aliases

# Cursor
# echo -e -n "\x1b[\x30 q" # changes to blinking block
# echo -e -n "\x1b[\x31 q" # changes to blinking block also
# echo -e -n "\x1b[\x32 q" # changes to steady block
# echo -e -n "\x1b[\x33 q" # changes to blinking underline
# echo -e -n "\x1b[\x34 q" # changes to steady underline
echo -e -n "\x1b[\x35 q" # changes to blinking bar
# echo -e -n "\x1b[\x36 q" # changes to steady bar



[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source ~/.bash_alias
# source ~/.fonts/*.sh
# ~/.local/bin/fetch
# export collor1="\e[32m"
# export collor2="\e[36m"
pfetch
# 
# echo -e $collor1"I Use Arch Linux
# very fast linux distro!"
# 
# echo -e $collor2"Hint! 🫑"
# echo -e $collor2"pacman -S   'package_name'"
# echo -e $collor2"pacman -Rns 'package_name'"
# echo -e $collor2"sudo pacman -Syyu 'update'"

# COWPATH="$COWPATH:$HOME/.cowsay/cowfiles"
# # Cow-spoken fortunes every time you open a terminal
# function cowsayfortune {
#     NUMOFCOWS=`cowsay -l | tail -n +2 | wc -w`
#     WHICHCOW=$((RANDOM%$NUMOFCOWS+1))
#     THISCOW=`cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d'`

#     #echo "Selected cow: ${THISCOW}, from ${WHICHCOW}"
#     fortune | cowsay -f $THISCOW -W 100
# }

# fortune

# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
. ~/.config/powerline/.powerline.sh




