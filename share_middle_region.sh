#!/usr/bin/env bash

set -Eeuo pipefail

REGION_WIDTH=2560
REGION_HEIGHT=1440
REGION_X=1280
REGION_Y=0
FRAME_RATE=30

DISPLAY_BASE="${DISPLAY%%.*}"

ffmpeg \
    -f x11grab \
    -draw_mouse 0 \
    -framerate "$FRAME_RATE" \
    -video_size "${REGION_WIDTH}x${REGION_HEIGHT}" \
    -i "${DISPLAY_BASE}.0+${REGION_X},${REGION_Y}" \
    -an \
    -vf format=yuv420p \
    -f rawvideo \
    -pix_fmt yuv420p - |
ffplay \
    -f rawvideo \
    -pixel_format yuv420p \
    -video_size "${REGION_WIDTH}x${REGION_HEIGHT}" \
    -framerate "$FRAME_RATE" \
    -window_title "Teams - Middle Region" \
    -left 20 \
    -top 20 \
    -x 640 \
    -y 360 \
    -i -