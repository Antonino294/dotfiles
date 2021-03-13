#!/bin/bash
xrdb -load .cache/wal/colors.Xresources

file=$(ls -t -- Immagini/Landscapes/* | sxiv - -bto)
mode=$(echo -e "fill\ncenter\ntile\nscale\nno-xinerama" | rofi -dmenu)

feh --bg-$mode $file

wal --backend wal -i $file -stne ||
wal --backend haishoku -i $file -stne ||
wal --backend colorz -i $file -stne ||
wal --backend colorthief -i $file -stne

color1=$(grep '*color13:  ' $HOME/.cache/wal/colors.Xresources | sed s/"*color13:  "//)
color2=$(grep '*color15:  ' $HOME/.cache/wal/colors.Xresources | sed s/"*color15:  "//)
color3=$(grep '*color0:  ' $HOME/.cache/wal/colors.Xresources | sed s/"*color0:  "//)

sed -i -e "s/#define color1 #.*/#define color1 $color1/g; \
	s/#define color2 #.*/#define color2 $color2/g" \
	$HOME/.config/glava/bars.glsl

sed -i -e "s/ gradient_color_1 = '#.*'/ gradient_color_1 = '$color1'/g; \
	s/ gradient_color_2 = '#.*'/ gradient_color_2 = '$color2'/g" \
	$HOME/.config/cava/config

sed -i -e "s/shade1 = .*/shade1 = $color1/g" \
	$HOME/.config/polybar/config

sed -i -e "s/\.border_color = .*/.border_color = \"$color1\",/g; \
	s/\.background_color = .*/.background_color = \"$color3\",/g " \
	$HOME/Build-Folder/xmenu/config.h

sed -i -e "s/hc attr theme.active.color1 .*/hc attr theme.active.color \'$color1\'/g" \
	$HOME/.config/herbstluftwm/autostart

herbstclient attr theme.floating.active.color $color1
pgrep -x cava && pkill -USR1 cava
pgrep -x glava && pkill -USR1 glava
make install -C $HOME/Build-Folder/xmenu/
pywalfox update > /dev/null 2>&1
