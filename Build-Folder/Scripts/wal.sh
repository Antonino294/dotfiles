#!/bin/sh
xrdb -load .cache/wal/colors.Xresources

case "$1" in
	rand) file=$(find "$HOME"/Immagini/Landscapes -type f | shuf -n 1) ;;
	*) file=$(ls -t -- "$HOME"/Immagini/Landscapes/* | sxiv - -bto) ;;
esac

case "$2" in
	fill) mode=fill ;;
	center) mode=center ;;
	tile) mode=tile ;;
	scale) mode=scale ;;
	*) mode=$(printf "fill\ncenter\ntile\nscale" | rofi -dmenu) ;;
esac

#mode=$(printf "fill\ncenter\ntile\nscale\nno-xinerama" | rofi -dmenu)

feh --bg-"$mode" "$file"

wal --backend wal -i "$file" -stne --saturate 0.3 ||
wal --backend haishoku -i "$file" -stne ||
wal --backend colorz -i "$file" -stne --saturate 1.0 ||
wal --backend colorthief -i "$file" -stne --saturate 1.0

color1=$(grep '\*color13:' "$HOME"/.cache/wal/colors.Xresources | sed s/"*color13:  "//)
color2=$(grep '\*color15:' "$HOME"/.cache/wal/colors.Xresources | sed s/"*color15:  "//)
color3=$(grep '\*color0:' "$HOME"/.cache/wal/colors.Xresources | sed s/"*color0:  "//)
color4=$(grep '\*color4:' "$HOME"/.cache/wal/colors.Xresources | sed s/"*color4:  "//)

sed -i -e "s/#define color1 #.*/#define color1 $color2/g; \
	s/#define color2 #.*/#define color2 $color1/g" \
	"$HOME"/.config/glava/bars.glsl

sed -i -e "s/ gradient_color_1 = '#.*'/ gradient_color_1 = '$color1'/g; \
	s/ gradient_color_2 = '#.*'/ gradient_color_2 = '$color2'/g" \
	"$HOME"/.config/cava/config

sed -i -e "s/shade1 = .*/shade1 = $color1/g; \
	s/shade2 = .*/shade2 = $color2/g; \
	s/shade3 = .*/shade3 = $color4/g" \
	"$HOME"/.config/polybar/config

sed -i -e "s/\.border_color = .*/.border_color = \"$color1\",/g; \
	s/\.background_color = .*/.background_color = \"$color3\",/g " \
	"$HOME"/Build-Folder/xmenu/config.h

sed -i -e "s/hc attr theme.active.color .*/hc attr theme.active.color \'$color1\'/g; \
	s/hc attr theme.floating.active.color .*/hc attr theme.floating.active.color \'$color1\'/g; \
	s/hc attr theme.normal.color .*/hc attr theme.normal.color \'$color2\'/g" \
	"$HOME"/.config/herbstluftwm/autostart

sed -i -e "s/background = \"#.*\"/background = \"$color3\"/g; \
	s/frame_color = \"#.*\"/frame_color = \"$color1\"/g" \
	"$HOME"/.config/dunst/dunstrc

herbstclient attr theme.active.color "$color1"
herbstclient attr theme.floating.active.color "$color1"
herbstclient attr theme.normal.color "$color2"
pgrep -x cava && pkill -USR1 cava
pgrep -x glava && pkill -USR1 glava
killall dunst ; notify-send -t 2500 "Reload Complete." "Applied changes."
make install -C "$HOME"/Build-Folder/xmenu/
pywalfox update > /dev/null 2>&1
/home/antonino/Build-Folder/Scripts/waltauon.sh &
#pkill picom ; picom --vsync --config .config/picom/picom.conf &
