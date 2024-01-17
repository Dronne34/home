#!/usr/bin/env bash
# exec float "$@" | ${SHELL:-"/bin/sh"} &
# exec slstatus &
# xauth generate $DISPLAY
# exec xautolock -time 2 -notify 20 -notifier "brightness" &
# exec xautolock -locker lock -time 1 &
# exec conky -c ~/.config/conky/conky-blue.conf &
# exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# xrandr --output eDP1 --brightness 1.2 &
# exec xset dpms 200 300 360 &
# exec xfce4-power-manager --daemon &
#xrandr --output eDP1 --brightness 1.2 &
exec xset -dpms &
exec ~/.local/bin/loop.sh &
exec xautolock -locker "betterlockscreen -l blur" -time 5 -notifier "dim-screen" -corners "0--0" -cornersize "200" -notify "240" -killtime 10 -killer "systemctl suspend" &
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
exec picom --config  ~/.config/picom/picom.conf  &
exec nitrogen --restore &
exec xrandr -s 1920x1080 &
exec xrdb -merge ~/.Xresources  &
exec chmod u+x ~/.local/bin/* &
exec eval "$(ssh-agent -s)"  &
exec sxhkd &    
exec dunst &
exec dwmblocks & 
exec ~/.local/bin/relaunch 
exec dwm
