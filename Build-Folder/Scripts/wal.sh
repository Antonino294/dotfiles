#!/bin/bash

nitrogen 

file=$(grep 'file=' /home/antonino/.config/nitrogen/bg-saved.cfg | sed s/file=//)

wal --backend colorz  -i $file -s -t -n -e

#color=$(grep '*color10:  ' /home/antonino/.cache/wal/colors.Xresources | sed s/"*color10:  "//)
color=$(grep '*color13:  ' /home/antonino/.cache/wal/colors.Xresources | sed s/"*color13:  "//)

sed -i -e "s/shade1 = .*/shade1 = $color/g" $HOME/.config/polybar/config

sleep 1; herbstclient pad 0 "29" "0" "0"
