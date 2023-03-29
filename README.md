# elementary-os-scripts

# Install

```
git clone git@github.com:ldrahnik/elementary-os-scripts.git
cd elementary-os-scripts
chmod +x *.sh
```

## Special keys functionalities

- **Disabling/Enabling camera** (custom keyboard shortcut (Fn+special key) usage: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_camera.sh`)
- **Disabling/Enabling microphone** (custom keyboard shortcut (Fn+special key) usage: `sh /home/ldrahnik/projects/elementary-os-scripts/toggle_microphone.sh`)
- **Disabling/Enabling touchpad** (custom keyboard shortcut (Fn+special key) usage: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_touchpad.sh`)
- **Toggle calculator** (custom keyboard shortcut (key `XF86Calculator` has to be added via `$ sudo apt install dconf-editor` `/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/customX/binding`) with command: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_calculator.sh`, key for calculator can be tested with command `xdotool key XF86Calculator`)

## Plank icon

- **Show/Hide onboard keyboard (script & icon for dock, useful for 2v1 devices when is mode changed to tablet and you want imediately or by icon show onboard keyboard, dock can be setup `onboard Settings` -> `Window` -> `Window options` -> `Docking` -> check `Dock to screen edge`)**

```
$ sudo gedit /usr/share/applications/screenkeyboard.desktop
```
```
[Desktop Entry]
Name=Screen keyboard
Exec=bash /home/ldrahnik/projects/elementary-os-scripts/toggle_screenkeyboard.sh
Icon=/usr/share/icons/elementary/devices/24/input-keyboard-symbolic.svg
Terminal=false
Type=Application
StartupNotify=true
```

## Credits

[how-can-i-disable-my-webcam](https://askubuntu.com/questions/166809/how-can-i-disable-my-webcam)
