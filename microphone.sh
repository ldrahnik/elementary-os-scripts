#!/bin/bash

if amixer -D pulse set Capture toggle | grep "\[on\]" -q
then 
   notify-send -i audio-input-microphone-symbolic " " -a " "
else
   notify-send -i microphone-sensitivity-muted-symbolic " " -a ""
fi
