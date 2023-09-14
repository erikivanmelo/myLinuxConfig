#!/bin/sh
xrandr --addmode HDMI-A-0 1920x1080
xrandr --output HDMI-A-0 --primary --mode 1920x1080 --rate 60 --pos 0x0 --rotate normal --output DisplayPort-0 --mode 1366x768 --rate 60 --pos 1920x0 --rotate left
xrandr --output HDMI-A-0 --gamma 1.6:1.6:1.2 --brightness 1
#xrandr --dpi 276 --fb  --output HDMI-A-0 --primary --mode 1920x1080 --rate 60 --pos 0x0 --rotate normal --output DVI-D-0 --off --output DisplayPort-0 --mode 1366x768 --rate 60 --pos 1920x0 --rotate left
