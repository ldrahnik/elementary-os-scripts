#!/bin/bash

PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

AC=$(cat /sys/class/power_supply/AC0/online)

if [[ $AC = "1" ]]; then
    echo "Enabling ac mode"
    sh $PARENT_PATH/ac_mode.sh
else
    echo "Enabling battery mode"
    sh $PARENT_PATH/battery_mode.sh
fi
