#!/bin/bash

if amixer -D pulse set Capture toggle | grep "\[on\]" -q
then 
   notify-send -i audio-input-microphone-symbolic "Unmuted" -a "Microphone"
else
   notify-send -i microphone-sensitivity-muted-symbolic "Muted" -a "Microphone"
fi
