#!/bin/bash
# Checks if monitor is connected; if not, resets to default config

connected=true
while $connected; do
	check=$(xrandr | grep "HDMI-1 connected")
	if [ -z "$check" ]; then
		#if HDMI is not connected
		connected=false
		xrandr -s 0
	fi
	sleep 5
done
