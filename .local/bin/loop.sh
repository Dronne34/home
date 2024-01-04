#!/bin/bash
while :; do
	~/.local/bin/size.sh	
    sleep 3
	# kill -s SIGUSR1 $(pgrep sleep)
echo "Sleep for 3 seconds!"
done
