#!/bin/bash

export DISPLAY=:0.0

function connect(){
xrandr --output VGA-1 --auto --primary
xrandr --output LVDS-1 --off
herbstclient reload
pkill redshift
}

function disconnect(){
xrandr --output VGA-1 --off
xrandr --output LVDS-1 --auto --primary
herbstclient reload
}

xrandr | grep "VGA-1 connected" &> /dev/null && connect || disconnect
xrdb -load "$HOME"/.cache/wal/colors.Xresources
kill $(($(pgrep -o polybar)+1))
