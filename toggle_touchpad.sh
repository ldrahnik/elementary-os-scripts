#!/bin/bash

TOUCHPAD_ID=`xinput | grep -oP '(ASUE.* Touchpad.*id=)[0-9]+' | cut -f2 -d =`

if (xinput list-props ${TOUCHPAD_ID} | grep "Device Enabled.*:.*1" >/dev/null) then
    xinput disable ${TOUCHPAD_ID}
    #notify-send -i io.elementary.touchpad "Disabled touchpad" -a "Touchpad"
else
    xinput enable ${TOUCHPAD_ID}
    #notify-send -i io.elementary.touchpad "Enabled touchpad" -a "Touchpad"
fi
