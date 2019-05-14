#!/bin/bash
xinput disable "SynPS/2 Synaptics TouchPad"

if [ ! -f /tmp/rotlock ]
then
	touch /tmp/rotlock
	if [ -f "/tmp/landscape" ]
	then
		xrandr -d :0 -o left
		rm /tmp/landscape
		touch /tmp/portrait
	elif [ -f "/tmp/portrait" ]
	then
		xrandr -d :0 -o inverted
		rm /tmp/portrait
		touch /tmp/landscape
	else
		touch /tmp/landscape
		bash rotate.sh	
	fi
	killall polybar
	i3-msg exec polybar top
	i3-msg exec polybar bottom
	sleep 1
	rm /tmp/rotlock
fi

feh --bg-fill /home/nimda/Pictures/treelava.jpg
xinput map-to-output "Wacom ISDv4 E6 Finger touch" LVDS-1
xinput map-to-output "Wacom ISDv4 E6 Pen eraser" LVDS-1
xinput map-to-output "Wacom ISDv4 E6 Pen stylus" LVDS-1
