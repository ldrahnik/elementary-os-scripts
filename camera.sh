#!/bin/bash


#if [[ $(/usr/bin/id -u) -ne 0 ]]; then
#    echo "Not running as root"
#    exit
#fi

# Without sudo is necessary be able write to camera devices:
#
# In my case:
#
# sudo chmod 777 /sys/bus/usb/devices/3-10/bConfigurationValue
# sudo chmod 777 /sys/bus/usb/devices/3-1/bConfigurationValue

VENDOR_ID=$(lsusb | grep Cam | awk 'NR==1{print $6}' | cut -d':' -f1)

DIRS_BY_VENDOR_ID=$(cd /sys/bus/usb/devices/ && grep $VENDOR_ID */idVendor | awk -F "/" '{print $1}')

typeset -i IS_CAMERA_ENABLED=0

for VENDOR_DIR in $DIRS_BY_VENDOR_ID
do
	IS_CAMERA_ENABLED=$(cat /sys/bus/usb/devices/$VENDOR_DIR/bConfigurationValue) 

	echo "Setting to vendor dir: \`/sys/bus/usb/devices/$VENDOR_DIR/bConfigurationValue\` a value:"

	if [[ IS_CAMERA_ENABLED -eq 1 ]]; then
		echo 0 | tee /sys/bus/usb/devices/$VENDOR_DIR/bConfigurationValue
	else
		echo 1 | tee /sys/bus/usb/devices/$VENDOR_DIR/bConfigurationValue
	fi
done

if [[ IS_CAMERA_ENABLED -eq 1 ]]; then
	notify-send -i io.elementary.camera "Disabled camera" -a "Camera"
else
	notify-send -i io.elementary.camera "Enabled camera" -a "Camera"
fi
