#!/usr/bin/env bash

{

alias ll='lsd  -la --color=auto'
alias la='ls -a'
alias ls='lsd -la --color=auto'         
alias l.="ls -A | grep '^\.'" 
#github alias     
alias addup="git add -u"
alias branch="git branch"
alias checkout="git checkout"
alias clone="git clone"
alias commit="git commit -m"
alias fetch="git fetch"
alias pull="git pull origin"
alias push="git push origin"
alias stat="git status"  # 'status' is protected name so using 'stat' instead
alias tag="git tag"
alias gad="git add ."
alias grm="git rm --cached "
alias gl='gh repo list'
alias ga='gh auth login'
alias gc='gh repo clone'
alias gr='gh repo delete'



alias cd..='cd ..'
alias pdw="pwd"
alias b='bash'
alias k="killall"
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias cm='chmod u+x '

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#search
alias search='pacman -Ss'

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias update='sudo pacman -Syyu --noconfirm && echo -e "\e[38;5;76m  Updates Done!"'
alias mk='makepkg -sri'

# trizen as aur helper - updates everything
alias pksyua='trizen -Syu --noconfirm && echo -e "\e[38;5;76m  AUR Updates Done!"'

#ps
alias ps="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#improve png
# alias fixpng="find . -type f -name "*.png" -exec convert {} -strip {} \;"
alias mog="mogrify  -background none -format  png *.svg"
#add new fonts
alias fc='sudo fc-cache -fv'
alias fl='fc-list | grep -i '

#locatedb
alias lo='locate "\*.dat" -q '

#hardware info --short
alias hw="hwinfo --short"
alias xd="xdotool selectwindow getwindowgeometry"
#get fastest mirrors in your neighborhood 
alias mirror="sudo reflector -f 30 -l 30 --number 5 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Public /home/$USER/Public"


#alias media
alias nc="ncmpcpp"
alias ping='ping google.com -c5'
alias play='mplayer -msgcolor -msgmodule -nolirc'
alias playlist='mplayer -msgcolor -msgmodule -nolirc -playlist '
alias twitch='mpv --ytdl-raw-options=config-location=~/.config/yt-dlp/config'
alias yta-mp3='youtube-dl --extract-audio  -f bestaudio --audio-format mp3 --embed-thumbnail --prefer-ffmpeg --output "%(title)s.%(ext)s" '
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -100"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias trash='sudo rm -rf ~/.local/share/Trash/*'
alias temp='sudo rm -rf /tmp/*'
alias du="du -sh /var/cache/pacman/pkg/"

#copy files  
#alias cp='rsync -zvhP'
alias mv='rsync -zvhP --remove-source-files'

#qemu-system#
alias sda='sudo qemu-system-x86_64 -enable-kvm -m 4G -vga std  -drive file=/dev/sda,cache=none,if=virtio -boot d'
alias sdc='sudo qemu-system-x86_64 -enable-kvm -m 4G -vga std  -drive file=/dev/sdc,cache=none,if=virtio -boot d'
alias sdb='sudo qemu-system-x86_64 -enable-kvm -m 4G -vga std  -drive file=/dev/sdb,cache=none,if=virtio -boot d'

#SYSTEM#
alias zz='lsblk -f'
alias screen='scrcpy --max-size 1024'
alias re='sudo systemctl reboot -f'
alias po='sudo systemctl poweroff'
alias pwg="pwgen 12  -1 -n -s"
alias cmi="./configure && make && sudo make install"
alias wlpup="sudo ifconfig wlp0s20u2  up"
alias wlpdo="sudo ifconfig wlp0s20u2  down"


alias fat='sudo mkfs.fat -F32 -v -I -n USB /dev/sda'
alias fatb='sudo mkfs.fat -F32 -v -I /dev/sdb'
alias fatc='sudo mkfs.fat -F32 -v -I /dev/sdc'
alias lsblk="lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,UUID"

alias usb='systemctl --user restart gvfs-udisks2-volume-monitor'
alias reload="sudo systemctl restart NetworkManager.service"
alias start="sudo systemctl start NetworkManager.service"
alias stop="sudo systemctl stop NetworkManager.service"
alias iwd='sudo systemctl restart iwd && echo -e "\Uf2f1 \x1b[32;1m Iwd Restarted!"'
alias ctl="systemctl"
alias su="sudo su"
alias cl='clear'
alias ifc="ifconfig"
alias restore='pacman -S --needed - < pkglist.txt'
#package AUR
alias ml='sudo updatedb && echo -e "\Uf002\x1b[32;1m Database Update Done!"'

alias pkaur="pacman -Qqem > pkaur.txt"
alias pklist="comm -12 <(pacman -Qqe | sort) <(pacman -Sql core extra  | sort) > pkglist.txt"
alias tm="~/.local/shell/theme -i"
alias mkk="rm -rf config.h & make clean && make clean install"
alias pak="sudo pacman -Sy archlinux-keyring"
# alias font="fc-list :fontformat=TrueType -f "%{family}\n" | sort -u | fzf"

}