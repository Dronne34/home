#!/bin/bash
#Telegram-desktop Media viewer fix on float window using dwm
WIDS=`xdotool search --onlyvisible --name "Media viewer"`
for id in $WIDS; do
		  xdotool windowsize $id 1083 807
		  # sleep 1

  done

WIDS=`xdotool search --onlyvisible --name "Open File"`
for id in $WIDS; do
		  xdotool windowsize $id 1083 807
		  # sleep 1

  done

  WIDS=`xdotool search --onlyvisible --name "Save File"`
for id in $WIDS; do
		  xdotool windowsize $id 1083 807
		  # sleep 1

  done