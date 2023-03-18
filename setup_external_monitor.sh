#!/bin/bash

# Display laptop 2880x1800
#$ xrandr --output eDP-1 --scale 1x1 --pos 0x0 --mode 2880x1800 --fb 5760x3600


# After each start
xrandr --output eDP-1 --scale 0.9999x0.9999

# External monitor 1920x1080
xrandr --output HDMI-1 --scale 2x2 --pos 2880x0 --mode 1920x1080 --fb 7680x2160

# for fix screen ends where plank with icons on bottom starts
plank --preferences 
