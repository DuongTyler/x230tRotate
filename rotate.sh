#!/bin/bash
#xinput disable "SynPS/2 Synaptics TouchPad"

if [ -f "/tmp/normal" ]
then
	xrandr -d :0 -o normal --verbose >> ~/.debug
	xinput set-prop "Wacom ISDv4 E6 Pen eraser" 277 0
	xinput set-prop "Wacom ISDv4 E6 Finger touch" 277 0
	rm /tmp/normal
	touch /tmp/left
	echo "normal" >> ~/debug
elif [ -f "/tmp/left" ]
then
	xrandr -d :0 -o left --verbose >> ~/.debug
	xinput set-prop "Wacom ISDv4 E6 Pen eraser" 277 2
	xinput set-prop "Wacom ISDv4 E6 Finger touch" 277 2
	rm /tmp/left
	touch /tmp/inverted
	echo "left" >> ~/debug
elif [ -f "/tmp/inverted" ]
then
	xrandr -d :0 -o inverted --verbose >> ~/.debug
	xinput set-prop "Wacom ISDv4 E6 Pen eraser" 277 3
	xinput set-prop "Wacom ISDv4 E6 Finger touch" 277 3
	rm /tmp/inverted
	touch /tmp/right
	echo "inverted" >> ~/debug
elif [ -f "/tmp/right" ]
then
	xrandr -d :0 -o right --verbose >> ~/.debug
	xinput set-prop "Wacom ISDv4 E6 Pen eraser" 277 1
	xinput set-prop "Wacom ISDv4 E6 Finger touch" 277 1
	rm /tmp/right
	touch /tmp/normal
	echo "right" >> ~/debug
else
	touch /tmp/normal
fi
#feh --bg-fill /home/nimda/Pictures/weeb/powerlevel/franxx.png

#xinput disable 19 #disable touch
