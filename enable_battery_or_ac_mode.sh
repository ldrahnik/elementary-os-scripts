#!/bin/bash

AC=$(cat /sys/class/power_supply/AC0/online)

if [[ $AC = "1" ]]; then
    echo "Enabling ac mode"
    sh ./ac_mode.sh
else
    echo "Enabling battery mode"
    sh ./battery_mode.sh
fi
