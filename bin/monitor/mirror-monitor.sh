#!/bin/bash
# checks if HDMI is connected, and if so, mirrors to HDMI.

check=$(xrandr | grep "HDMI-1 connected")

if [ -z "$check" ]; then
	echo "No connections"
else
	xrandr --output "HDMI-1" --mode 1920x1080 --rate 60
	xrandr --output "HDMI-1" --same-as "LVDS-1"
	/home/jas/Scripts/monitor/background-check-disconnection.sh &
fi
