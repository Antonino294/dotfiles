#!/bin/bash

#nitrogen 
#file=$(grep 'file=' /home/antonino/.config/nitrogen/bg-saved.cfg | sed s/file=//)

xrdb -load .cache/wal/colors.Xresources

file=$(ls -t -- Immagini/Landscapes/* | sxiv - -bto)
mode=$(echo -e "fill\ncenter\ntile\nscale\nno-xinerama" | rofi -dmenu)

feh --bg-$mode $file

wal --backend wal -i $file -stne || wal --backend haishoku -i $file -stne || wal --backend colorz -i $file -stne || wal --backend colorthief -i $file -stne

#color=$(grep '*color10:  ' /home/antonino/.cache/wal/colors.Xresources | sed s/"*color10:  "//)
color=$(grep '*color13:  ' /home/antonino/.cache/wal/colors.Xresources | sed s/"*color13:  "//)
#color=$(grep '*color15:  ' /home/antonino/.cache/wal/colors.Xresources | sed s/"*color15:  "//)

sed -i -e "s/shade1 = .*/shade1 = $color/g" $HOME/.config/polybar/config

sed -i -e "s/.border_color = .*/.border_color = \"$color\",/g" $HOME/Build-Folder/xmenu/config.h
cd $HOME/Build-Folder/xmenu/ && make install

herbstclient attr theme.floating.active.color $color
sed -i -e "s/hc attr theme.active.color .*/hc attr theme.active.color \'$color\'/g" $HOME/.config/herbstluftwm/autostart

pywalfox update > /dev/null 2>&1

sleep 1; herbstclient pad 0 "29" "0" "0"
