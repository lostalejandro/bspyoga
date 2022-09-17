#!/bin/sh
xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate left --output DP1 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
xinput --set-prop "Wacom HID 515F Finger touch" "Coordinate Transformation Matrix" 0, -1, 1, 1, 0, 0, 0, 0, 1
xsetwacom set "Wacom HID 515F Pen stylus" rotate 0, -1, 1, 1, 0, 0, 0, 0, 1
xsetwacom set "Wacom HID 515F Pen eraser" rotate 0, -1, 1, 1, 0, 0, 0, 0, 1
bspc wm -r
