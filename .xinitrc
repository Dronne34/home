#!/usr/bin/env bash
# exec xss-lock  --transfer-sleep-lock -- ~/.config/i3/scripts/lock --nofork & 
# exec nitrogen --set-auto --random ~/.config/screen/ &
# exec float "$@" | ${SHELL:-"/bin/sh"} &
# exec slstatus &
# exec play_with_mpv &
# xauth generate $DISPLAY
# exec xautolock -time 2 -notify 20 -notifier "brightness" &
# exec xset dpms 0 0 120 &
exec xautolock -locker lock -time 1 &
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
# exec conky -c ~/.config/conky/conky-blue.conf &
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
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
