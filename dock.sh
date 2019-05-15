#!/bin/bash

user=$(w |grep tty7 |awk '{print $1}')
dp1=$(cat /sys/devices/pci0000\:00/0000\:00\:02.0/drm/card0/card0-DP-1/status)
dp2=$(cat /sys/devices/pci0000\:00/0000\:00\:02.0/drm/card0/card0-DP-2/status)
vga1=$(cat /sys/devices/pci0000\:00/0000\:00\:02.0/drm/card0/card0-VGA-1/status)

current=$(cat /tmp/xstatus)

export DISPLAY=":0"
export XAUTHORITY="/home/$user/.Xauthority"

prepare()
{
	xrandr --output LVDS-1 --crtc 1 --brightness 0.5
	xrandr --output DP-2 --crtc 0 --brightness 0.5
	xrandr --output DP-1 --crtc 0 --brightness 0.5
	xrandr --output VGA-1 --crtc 0 --brightness 0.5
	xinput enable 'SynPS/2 Synaptics TouchPad'
	xinput disable 'Wacom ISDv4 E6 Finger touch'
	xinput disable 'Wacom ISDv4 E6 Pen stylus'
	xinput disable 'Wacom ISDv4 E6 Pen eraser'
}

alloff()
{
	xrandr --output DP-1 --off
	xrandr --output LVDS-1 --off
	xrandr --output DP-2 --off
	xrandr --output VGA-1 --off
}

#if [ $current !=  ]; then
	prepare
	alloff
	killall polybar
	if [ $dp1 == "connected" ]; then
		echo "DP-1 Detected"
		xrandr --output DP-1 --crtc 1 --brightness 1 --mode "2560x1440" 
	fi
	if [ $dp2 == "connected" ]; then
		echo "DP-2 Detected"
		xrandr --output DP-2 --crtc 1 --brightness 1 --mode "2560x1440" --right-of VGA-1 --primary
		echo "connected" > /tmp/dp2status
	fi
	if [ $vga1 == "connected" ]; then
		echo "VGA Detected"
		xrandr --output VGA-1 --crtc 0 --brightness 1 --mode "1920x1200" 
	fi
	if [ $dp2 != "connected" ] || [ $vga1 != "connected" ] || [ $dp1 != "connected" ]; then
		echo "LVDS-1 Only"
		xrandr --output LVDS-1 --crtc 0 --brightness 1 --auto
		xinput enable 'Wacom ISDv4 E6 Finger touch'
		xinput enable 'Wacom ISDv4 E6 Pen stylus'
		xinput enable 'Wacom ISDv4 E6 Pen eraser'
		xinput map-to-output 'Wacom ISDv4 E6 Finger touch' LVDS-1
		xinput map-to-output 'Wacom ISDv4 E6 Pen stylus' LVDS-1
		xinput map-to-output 'Wacom ISDv4 E6 Pen eraser' LVDS-1
		xrandr --output DP-2 --right-of LVDS-1
		xrandr --output VGA-1 --left-of LVDS-1
		i3-msg exec polybar bottom
		echo "connected" > /tmp/lvdsstatus
	fi
	xrandr --output DP-2 --right-of VGA-1 --primary
	xrandr --output VGA-1 --left-of DP-2
	i3-msg exec polybar top
	feh --bg-fill /home/nimda/Pictures/treelava.jpg
#fi
