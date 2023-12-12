#!/bin/bash
xdotool getwindowfocus
xdotool key click 3
sleep 3
xdotool key click 1

# Get the copied text from the clipboard
copied_link=$(xclip -selection clipboard -o)

# Print the copied link
notify-send  "Copied link: $copied_link"

mpv $(xclip -o) & exit

