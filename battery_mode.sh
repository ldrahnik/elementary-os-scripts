#!/bin/sh

# set lower display brightness
FILE="/sys/class/backlight/intel_backlight/brightness";
echo "92" | sudo tee $FILE
