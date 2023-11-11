
#!/usr/bin/env bash

# exec xss-lock  --transfer-sleep-lock -- ~/.config/i3/scripts/lock --nofork & 
# exec nitrogen --set-auto --random ~/.config/screen/ &
# exec float "$@" | ${SHELL:-"/bin/sh"} &
# exec conky -c ~/.config/conky/clock.conf &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
exec picom --config  ~/.config/picom/picom.conf  &
exec nitrogen --restore &
exec xrandr -s 1920x1080 &
exec xrdb -merge ~/.Xresources  &
exec chmod u+x .local/bin/* &
exec eval "$(ssh-agent -s)"  &
exec sxhkd &    
exec dunst &
# exec $(sleep 4s && "$HOME/bar.sh") &
# exec awesome
# exec i3
# exec xmobar &
# exec xmonad
# exec slstatus &
exec dwmblocks & 
exec ~/.local/bin/relaunch 
exec dwm
