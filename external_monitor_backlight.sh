#!/bin/bash
set -u

CONNECTOR="/sys/class/drm/card1-DP-2/status"
BACKLIGHT="/sys/class/backlight/intel_backlight/brightness"
STATE_DIR="/var/lib/external-monitor-backlight"
STATE_FILE="$STATE_DIR/original-brightness"
LOCK_FILE="/run/lock/external-monitor-backlight.lock"

exec 9>"$LOCK_FILE"
flock 9

mkdir -p "$STATE_DIR"
sleep 1

if [[ ! -r "$CONNECTOR" || ! -r "$BACKLIGHT" ]]; then
    logger -t external-monitor-backlight \
        "Connector or backlight device unavailable"
    exit 1
fi

status="$(cat "$CONNECTOR")"

if [[ "$status" == "connected" ]]; then
    if [[ ! -f "$STATE_FILE" ]]; then
        current="$(cat "$BACKLIGHT")"
        [[ "$current" =~ ^[0-9]+$ ]] || exit 1

        printf '%s\n' "$current" > "$STATE_FILE"
        chmod 600 "$STATE_FILE"
    fi

    if [[ "$(cat "$BACKLIGHT")" != "0" ]]; then
        if printf '0\n' > "$BACKLIGHT"; then
            logger -t external-monitor-backlight \
                "External monitor connected; brightness set to minimum"
        else
            logger -t external-monitor-backlight \
                "Failed to dim built-in display"
            exit 1
        fi
    fi

elif [[ "$status" == "disconnected" ]]; then
    if [[ -f "$STATE_FILE" ]]; then
        original="$(cat "$STATE_FILE")"
        [[ "$original" =~ ^[0-9]+$ ]] || exit 1

        if printf '%s\n' "$original" > "$BACKLIGHT"; then
            rm -f "$STATE_FILE"
            logger -t external-monitor-backlight \
                "External monitor disconnected; brightness restored"
        else
            logger -t external-monitor-backlight \
                "Failed to restore brightness"
            exit 1
        fi
    fi
fi
