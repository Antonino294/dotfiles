#!/bin/sh

width=$(xdotool getactivewindow getwindowgeometry | awk '/Geometry/{print $2}' | sed "s/x.*//g")
height=$(xdotool getactivewindow getwindowgeometry | awk '/Geometry/{print $2}' | sed "s/.*x//g")

xdotool getactivewindow windowmove $((683-width/2)) $((398-height/2))
