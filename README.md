# elementary-os-scripts

## Special keys functionalities

- **Disabling/Enabling camera** (custom keyboard shortcut (Fn+special key) usage: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_camera.sh`)
- **Disabling/Enabling microphone** (custom keyboard shortcut (Fn+special key) usage: `sh /home/ldrahnik/projects/elementary-os-scripts/toggle_microphone.sh`)
- **Disabling/Enabling touchpad** (custom keyboard shortcut (Fn+special key) usage: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_touchpad.sh`)
- **Run calculator** (custom keyboard shortcut (key `XF86Calculator` has to be added via `$ sudo apt install dconf-editor` `/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/customX/binding`) with command: `io.elementary.calculator` | `flatpak run io.elementary.calculator`, key for calculator can be tested with command `xdotool key XF86Calculator`)
- **Toggle calculator** (custom keyboard shortcut (key `XF86Calculator` has to be added via `$ sudo apt install dconf-editor` `/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/customX/binding`) with command: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_calculator.sh`, key for calculator can be tested with command `xdotool key XF86Calculator`)

## Plank icon

- **Show/Hide onboard keyboard (script & icon for dock)** (useful for 2v1 devices when is mode changed to tablet and you want imediately or by icon show onboard keyboard)

## On startup

- **Disabling bluetooth** (startup script usage: `sh /home/ldrahnik/projects/elementary-os-scripts/disable_bluetooth.sh`)

## Drivers

- **Allow modify AC and battery mode (e.g. change brightness)** ([power-supply-mode-switcher-driver]( https://github.com/ldrahnik/power-supply-mode-switcher-driver))

## Credits

[how-can-i-disable-my-webcam](https://askubuntu.com/questions/166809/how-can-i-disable-my-webcam)
