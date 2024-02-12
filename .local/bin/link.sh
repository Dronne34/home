#!/bin/bash
xdotool getwindowfocus 
sleep 0.2 
xdotool  key click 3 
xdotool  key Down 
xdotool  key Down 
xdotool  key Down 
xdotool  key Down 
xdotool  key Down 
# xdotool  key Down 
# copied_link=$(xclip -selection clipboard -o)
# notify-send  "Copied link: $copied_link"
xdotool key Return 
mpv $(xclip -o) & exit 

