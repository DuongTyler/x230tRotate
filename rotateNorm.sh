#!/bin/bash
user=$(who |grep tty7 |awk '{print $1}')
export DISPLAY=":0"
export XAUTHORITY="/home/$user/.Xauthority"
#xrandr -d :0 -o normal --verbose &> /home/nimda/.acpiInvRotateDebug
xrandr --output LVDS-1 --rotate normal --verbose &> /home/nimda/.acpiInvRotateDebug
xinput map-to-output "Wacom ISDv4 E6 Finger touch" LVDS-1 &>> /home/nimda/.acpiInvRotateDebug
xinput map-to-output "Wacom ISDv4 E6 Pen eraser" LVDS-1 &>> /home/nimda/.acpiInvRotateDebug
xinput map-to-output "Wacom ISDv4 E6 Pen stylus" LVDS-1 &>> /home/nimda/.acpiInvRotateDebug
exec xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 1
rm /tmp/inverted
rm /tmp/left
touch /tmp/right
#feh --bg-fill /home/nimda/Pictures/775084.jpg
feh --bg-fill /home/nimda/Pictures/acstonehenge.jpg
#chown nimda:nimda /home/nimda/.acpiInvRotateDebug
