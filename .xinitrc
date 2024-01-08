#!/usr/bin/env bash
# exec float "$@" | ${SHELL:-"/bin/sh"} &
# exec slstatus &
# xauth generate $DISPLAY
# exec xautolock -time 2 -notify 20 -notifier "brightness" &
# exec xautolock -locker lock -time 1 &
# exec conky -c ~/.config/conky/conky-blue.conf &
# exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
exec ~/.local/bin/loop.sh &
# exec xset dpms 0 0 120 &
exec xautolock -locker "betterlockscreen -l" -time 1 &
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
exec xfce4-power-manager --daemon &
exec picom --config  ~/.config/picom/picom.conf  &
exec nitrogen --restore &
exec xrandr -s 1920x1080 &
exec xrdb -merge ~/.Xresources  &
exec chmod u+x .local/bin/* &
exec eval "$(ssh-agent -s)"  &
exec sxhkd &    
exec dunst &
exec dwmblocks & 
exec ~/.local/bin/relaunch 
exec dwm
