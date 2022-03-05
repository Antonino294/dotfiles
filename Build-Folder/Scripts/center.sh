#!/bin/sh

X=$(xrandr | grep ' connected' | cut -d' ' -f4 | sed 's/....$//' | cut -d 'x' -f1)
Y=$(xrandr | grep ' connected' | cut -d' ' -f4 | sed 's/....$//' | cut -d 'x' -f2)

width=$(xdotool getactivewindow getwindowgeometry | awk '/Geometry/{print $2}' | sed "s/x.*//g")
height=$(xdotool getactivewindow getwindowgeometry | awk '/Geometry/{print $2}' | sed "s/.*x//g")
pad=$(herbstclient get_attr monitors.focus.pad_up)

[ "$pad" = "29" ] && xdotool getactivewindow windowmove $(( (X/2) - width/2)) $(( ((Y/2) + 14) - height/2 ))
[ "$pad" != "29" ] && xdotool getactivewindow windowmove $(( (X/2) - width/2)) $(( (Y/2) - height/2 ))
