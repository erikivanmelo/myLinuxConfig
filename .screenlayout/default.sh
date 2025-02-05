#!/bin/sh
xrandr --output eDP-1 --scale 0.8x0.8 --mode 1680x1050 --pos 0x240 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --pos 1344x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off
feh --bg-scale ~/Pictures/wallpaper/background.jpg --bg-scale ~/Pictures/wallpaper/login.png
xinput map-to-output "ELAN9004:00 04F3:4348" "eDP-1"
