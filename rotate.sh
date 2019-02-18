#!/bin/bash
xinput disable "SynPS/2 Synaptics TouchPad"
xinput disable "SynPS/2 Synaptics TouchPad"
xbindkeys

if [ -f "/tmp/normal" ]
then
	xrandr -d :0 -o normal --verbose >> ~/.debug
	xinput set-prop "Wacom ISDv4 E6 Pen eraser" 277 0
	xinput set-prop "Wacom ISDv4 E6 Finger touch" 277 0
	#xinput set-prop 10 --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
	#xinput set-prop 17 --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
	rm /tmp/normal
	touch /tmp/left
	#normal.sh
	echo "normal" >> ~/debug
elif [ -f "/tmp/left" ]
then
	xrandr -d :0 -o left --verbose >> ~/.debug
	xinput set-prop "Wacom ISDv4 E6 Pen eraser" 277 2
	xinput set-prop "Wacom ISDv4 E6 Finger touch" 277 2
	#xinput set-prop 10 --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
	#xinput set-prop 17 --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
	rm /tmp/left
	touch /tmp/inverted
	#left.sh
	echo "left" >> ~/debug
elif [ -f "/tmp/inverted" ]
then
	xrandr -d :0 -o inverted --verbose >> ~/.debug
	xinput set-prop "Wacom ISDv4 E6 Pen eraser" 277 3
	xinput set-prop "Wacom ISDv4 E6 Finger touch" 277 3
	#xinput set-prop 10 --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
	#xinput set-prop 17 --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
	rm /tmp/inverted
	touch /tmp/right
	#inverted.sh
	echo "inverted" >> ~/debug
elif [ -f "/tmp/right" ]
then
	xrandr -d :0 -o right --verbose >> ~/.debug
	xinput set-prop "Wacom ISDv4 E6 Pen eraser" 277 1
	xinput set-prop "Wacom ISDv4 E6 Finger touch" 277 1
	#xinput set-prop 10 --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
	#xinput set-prop 17 --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
	rm /tmp/right
	touch /tmp/normal
	#right.sh
	echo "right" >> ~/debug
else
	touch /tmp/normal
fi
feh --bg-fill /home/nimda/Pictures/weeb/powerlevel/franxx.png

#xinput disable 19 #disable touch
