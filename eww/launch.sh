#!/bin/bash

## Files and cmd
FILE="$HOME/.cache/eww_launch.xyz"
EWW="eww"

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	eww daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	eww open conkeww-main
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	eww close-all && killall eww && rm -f "$FILE"
fi
