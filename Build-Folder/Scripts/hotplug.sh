#!/bin/bash

X=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Y=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)

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
setxkbmap -option caps:escape_shifted_capslock
xrdb -load "$HOME"/.cache/wal/colors.Xresources
sed -i -e "s/#request setgeometry .*/#request setgeometry -3 0 $((X+7)) $Y/g" ~/.config/glava/rc.glsl
#kill $(($(pgrep -o polybar)+1))
