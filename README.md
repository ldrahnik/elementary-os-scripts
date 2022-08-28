# elementary-os-scripts

## Special keys functionalities

- **Disabling/Enabling camera** (custom keyboard shortcut (Fn+special key) usage: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_camera.sh`)
- **Disabling/Enabling microphone** (custom keyboard shortcut (Fn+special key) usage: `sh /home/ldrahnik/projects/elementary-os-scripts/toggle_microphone.sh`)
- **Disabling/Enabling touchpad** (custom keyboard shortcut (Fn+special key) usage: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_touchpad.sh`)
- **Do an area screenshot** (custom keyboard shortcut (Fn+special key) usage: `sh /home/ldrahnik/projects/elementary-os-scripts/area_screenshot.sh`)
- **Run calculator** (custom keyboard shortcut (key `XF86Calculator` has to be added via `dconf` `/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/customX/binding`) with command: `io.elementary.calculator` | `flatpak run io.elementary.calculator`, key for calculator can be tested with command `xdotool key XF86Calculator`)
- **Toggle calculator** (custom keyboard shortcut (key `XF86Calculator` has to be added via `dconf` `/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/customX/binding`) with command: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_calculator.sh`, key for calculator can be tested with command `xdotool key XF86Calculator`)

## Plank icon

- **Show/Hide onboard keyboard (script & icon for dock)** (useful for 2v1 devices when is mode changed to tablet and you want imediately or by icon show onboard keyboard)

## On startup

- **Disabling bluetooth** (startup script usage: `sh /home/ldrahnik/projects/elementary-os-scripts/disable_bluetooth.sh`)
- **Enable ac or battery mode** (startup script usage `bash /home/ldrahnik/projects/elementary-os-scripts/enable_ac_or_battery_mode.sh`)

## System rules

- **Change brightness on power supply mode change (AC/battery)**

Create file `80-power_supply.rules` in user rules `/usr/lib/udev/rules.d` or `/etc/udev/rules.d`:
```
SUBSYSTEM=="power_supply", ENV{POWER_SUPPLY_ONLINE}=="0", RUN+="/home/ldrahnik/projects/elementary-os-scripts/battery_mode.sh"
SUBSYSTEM=="power_supply", ENV{POWER_SUPPLY_ONLINE}=="1", RUN+="/home/ldrahnik/projects/elementary-os-scripts/ac_mode.sh"
```
Allow executing:
```
chmod +x /home/ldrahnik/projects/elementary-os-scripts/battery_mode.sh
chmod +x /home/ldrahnik/projects/elementary-os-scripts/ac_mode.sh
```

Reload udev rules:
```
sudo udevadm control --reload-rules && udevadm trigger
```

## TODO

- [ ] (Screenshots are not saved clipboard neither to `Screenshots` folder)

## Credits

[how-can-i-disable-my-webcam](https://askubuntu.com/questions/166809/how-can-i-disable-my-webcam)
