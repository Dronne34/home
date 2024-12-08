#!/bin/bash

# Function to get screen dimensions
get_screen_dimensions() {
    screen_width=$(xwininfo -root | grep 'Width' | awk '{print $2}')
    screen_height=$(xwininfo -root | grep 'Height' | awk '{print $2}')
}

# Function to get the list of all windows
get_windows() {
    wmctrl -l | awk '{print $1}'  # Get the window IDs
}

# Function to check if a window is floating (using xprop)
is_floating_window() {
    window_id=$1
    # Check for 'floating' in the WM_STATE
    floating=$(xprop -id $window_id 2>/dev/null | grep -i 'WM_STATE' | grep -i 'floating')
    
    if [[ -n "$floating" ]]; then
        return 0  # True (floating)
    else
        return 1  # False (not floating)
    fi
}

# Function to move the window to the center
center_window() {
    window_id=$1
    # Check if the window still exists
    if ! xwininfo -id $window_id &>/dev/null; then
        return 1  # Window no longer exists
    fi
    
    # Get the window geometry (width and height)
    geometry=$(xwininfo -id $window_id | grep 'Geometry' | awk '{print $2}')
    
    # Extract width and height of the window
    window_width=$(echo $geometry | cut -d 'x' -f 1)
    window_height=$(echo $geometry | cut -d 'x' -f 2)
    
    # Calculate the center position
    center_x=$(( (screen_width - window_width) / 2 ))
    center_y=$(( (screen_height - window_height) / 2 ))

    # Move the window to the center
    wmctrl -i -r $window_id -e 0,$center_x,$center_y,-1,-1
}

# Main loop to keep the script running and check for floating windows
while true; do
    get_screen_dimensions

    # Loop through all windows
    for window_id in $(get_windows); do
        # Check if the window is floating
        if is_floating_window $window_id; then
            # Try to center the window
            center_window $window_id
        fi
    done
    
    # Check every second
    sleep 1
done

