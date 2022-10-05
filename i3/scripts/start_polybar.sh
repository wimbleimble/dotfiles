#! /bin/bash
killall polybar

if type "xrandr"; then
	i=0
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload "bar${i}" &
		let "++i"
	done
else
	polybar --reload main &
fi
