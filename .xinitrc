
#!/bin/bash

#Use xset-root 

# while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
#   do
#       sleep 1
#   done &


# while true; do
#     xsetroot -name "Memory $(free -m | grep '^Mem' | awk '{print "total: " $2 "MB used: " $3"MB"}') | CPU $(top -bn 1 | grep '^Cpu' | tr -d 'usy,' | awk '{print "user " $2 ", sys " $3}') | Uptime: $(uptime | awk '{print $3}' | tr -d ',') | Now playing: $(ncmpcpp --now-playing | tr -d '(:[:digit:])') | $( date +"%F %R" )"
#     sleep 2
# done &


exec nitrogen --restore &
exec xrandr -s 1920x1080 &
exec picom --config  ~/.config/picom/picom.conf  &
exec xrdb -merge ~/.Xresources  &
exec chmod +x .local/bin/* &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# exec conky -c ~/.config/conky/clock.conf &
# exec xss-lock  --transfer-sleep-lock -- ~/.config/i3/scripts/lock --nofork & 
exec eval "$(ssh-agent -s)"  &
# exec float "$@" | ${SHELL:-"/bin/sh"} &
exec sxhkd &    
exec dunst &
exec slstatus &

# exec dwmblocks &
exec ~/.local/bin/relaunch 
# exec awesome
# exec ~/.local/bin/dwmblocks 
exec ~/.local/bin/dwm
# exec i3
