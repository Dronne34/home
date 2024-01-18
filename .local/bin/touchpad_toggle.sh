#!/bin/bash

# xinput list
device=`xinput list --short | grep 'Touchpad' | sed 's/.*id=\([0-9]*\).*/\1/'`
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`

if [ $state == '1' ];then
  xinput --disable $device
  notify-send --icon=dialog-information -t 3000 "Disabled" "Your computer's touchpad is disabled."
else
  xinput --enable $device
  notify-send --icon=dialog-information -t 3000 "Enabled" "Your computer's touchpad is enabled."
fi

