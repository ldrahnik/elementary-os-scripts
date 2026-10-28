# elementary-os-scripts

# Install

```
$ git clone git@github.com:ldrahnik/elementary-os-scripts.git
$ cd elementary-os-scripts
$ chmod +x *.sh
```

## Special keys functionalities

- **Disabling/Enabling camera** (custom keyboard shortcut (Fn+special key) usage: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_camera.sh`)
- **Disabling/Enabling microphone** (custom keyboard shortcut (Fn+special key) usage: `sh /home/ldrahnik/projects/elementary-os-scripts/toggle_microphone.sh`)
- **Disabling/Enabling touchpad** (custom keyboard shortcut (Fn+special key) usage: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_touchpad.sh`)
- **Toggle calculator** (custom keyboard shortcut (key `XF86Calculator` has to be added via `$ sudo apt install dconf-editor` `/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/customX/binding`) with command: `bash /home/ldrahnik/projects/elementary-os-scripts/toggle_calculator.sh`, key for calculator can be tested with command `xdotool key XF86Calculator`)

## Show / Hide onboard keyboard using plank icon

- **Show/Hide onboard keyboard (script & icon for dock, useful for 2v1 devices when is mode changed to tablet and you want imediately or by icon show onboard keyboard, dock can be setup `onboard Settings` -> `Window` -> `Window options` -> `Docking` -> check `Dock to screen edge`)**

```
$ sudo gedit /usr/share/applications/screenkeyboard.desktop
```
```
[Desktop Entry]
Type=Application
Name=Screen keyboard
Exec=bash /home/ldrahnik/projects/elementary-os-scripts/toggle_screenkeyboard.sh
Icon=/usr/share/icons/elementary/devices/24/input-keyboard-symbolic.svg
Terminal=false
StartupNotify=true
Categories=Utility;
```

## Fix no-hiding mode of dock using plank icon

```
$ sudo gedit /home/ldrahnik/.local/share/applications/plank-refresh.desktop
```
```
[Desktop Entry]
Type=Application
Name=Refresh plank
Exec=bash /home/ldrahnik/projects/elementary-os-scripts/plank_refresh.sh
Icon=plank
Terminal=false
Categories=Utility;
```

## Decreases laptop display brightness

- Each time when is external monitor plugged and increases when is unplugged

```
$ sudo tee /etc/udev/rules.d/99-external-monitor-backlight.rules >/dev/null <<'EOF'
ACTION=="change", SUBSYSTEM=="drm", KERNEL=="card[0-9]*", ENV{HOTPLUG}=="1", RUN+="/usr/bin/systemd-run --no-block --collect --unit=external-monitor-backlight-$env{SEQNUM}.service /home/ldrahnik/projects/elementary-os-scripts/external_monitor_backlight.sh"
EOF

$ sudo udevadm control --reload-rules
```

- After the boot

```
$ sudo visudo -f /etc/sudoers.d/external-monitor-backlight
$ ldrahnik ALL=(root) NOPASSWD: /home/ldrahnik/projects/elementary-os-scripts/external_monitor_backlight.sh

$ chmod 755 /home/ldrahnik/projects/elementary-os-scripts/external_monitor_backlight.sh

$ cat > ~/.config/autostart/external-monitor-backlight.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=Decreases laptop display brightness
Exec=sudo -n /home/ldrahnik/projects/elementary-os-scripts/external_monitor_backlight.sh
Icon=video-display
Terminal=false
X-GNOME-Autostart-enabled=true
EOF
```

- Manually using created plank icon

```
$ cat > ~/.local/share/applications/external-monitor-backlight.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=Decreases laptop display brightness
Exec=sudo -n /home/ldrahnik/projects/elementary-os-scripts/external_monitor_backlight.sh
Icon=video-display
Terminal=false
X-GNOME-Autostart-enabled=true
EOF
```

## Sharing only part of the screen on ultra-width monitor

```
$ cat > ~/.local/share/applications/share-middle-region.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Teams - Middle Region
Exec=bash /home/ldrahnik/projects/elementary-os-scripts/share_middle_region.sh
Icon=video-display
Terminal=false
Categories=AudioVideo;Video;
StartupNotify=false
EOF
```

## Credits

[how-can-i-disable-my-webcam](https://askubuntu.com/questions/166809/how-can-i-disable-my-webcam)
