#!/bin/sh

# set normal display brightness
FILE="/sys/class/backlight/intel_backlight/brightness";
echo "405" | sudo tee $FILE
