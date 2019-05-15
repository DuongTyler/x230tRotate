#!/bin/bash
user=$(who |grep tty7 |awk '{print $1}')
export DISPLAY=":0"
export XAUTHORITY="/home/$user/.Xauthority"
#xrandr -d :0 -o inverted --verbose &> /home/nimda/.acpidebug
xrandr --output LVDS-1 --rotate inverted --verbose &> /home/nimda/.acpidebug
xinput map-to-output "Wacom ISDv4 E6 Finger touch" LVDS-1 &>> /home/nimda/.acpidebug
xinput map-to-output "Wacom ISDv4 E6 Pen eraser" LVDS-1 &>> /home/nimda/.acpidebug
xinput map-to-output "Wacom ISDv4 E6 Pen stylus" LVDS-1 &>> /home/nimda/.acpidebug
exec xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0
rm /tmp/inverted
rm /tmp/left
touch /tmp/right
feh --bg-fill /home/nimda/Pictures/acstonehenge.jpg
chown nimda:nimda /home/nimda/.acpidebug
