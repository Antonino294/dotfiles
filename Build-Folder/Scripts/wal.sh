#!/bin/sh
xrdb -load .cache/wal/colors.Xresources

while getopts "hrm:b:" o; do
	case "${o}" in
		r) r_flag=1 ;;
		m) m_flag="${OPTARG}" ;;
		b) b_flag="${OPTARG}" ;;
		h)
			echo  "usage:"
			echo  "  -h\tshow this message"
			echo  "  -r\tchoose random image"
			echo  "  -m\tchoose feh bg mode"
			echo  "  -b\twal backend, check wal --backend"
			exit 1
			;;
		*)
			echo "Unknown option specified. Exiting..."
			exit 1
			;;
	esac
done

case "$r_flag" in
	1) file=$(find "$HOME"/Immagini/Landscapes -type f | shuf -n 1) ;;
	*) file=$(ls -t -- "$HOME"/Immagini/Landscapes/* | sxiv - -bto -g 470x470) ;;
esac

case "$m_flag" in
	fill) mode=fill ;;
	center) mode=center ;;
	tile) mode=tile ;;
	scale) mode=scale ;;
	*) mode=$(printf "fill\ncenter\ntile\nscale" | rofi -dmenu) ;;
esac

[ -z "$file" ] && file=$(find "$HOME"/Immagini/Landscapes -type f | shuf -n 1)

feh --bg-"$mode" "$file"
pkill -USR1 picom

case "$b_flag" in
	wal) wal --backend wal -i "$file" -stne --saturate 0.4 -q ;;
	haishoku) wal --backend haishoku -i "$file" -stne -q ;;
	colorz) wal --backend colorz -i "$file" -stne --saturate 0.6 -q ;;
	colorthief) wal --backend colorthief -i "$file" -stne --saturate 1.0 -q ;;

	*)	wal --backend wal -i "$file" -stne --saturate 0.4 -q ||
		wal --backend haishoku -i "$file" -stne -q ||
		wal --backend colorz -i "$file" -stne --saturate 0.6 -q ||
		wal --backend colorthief -i "$file" -stne --saturate 1.0 -q ;;
esac

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

make install -C "$HOME"/Build-Folder/xmenu/ >/dev/null
pywalfox update >/dev/null 2>&1
$HOME/Build-Folder/Scripts/waltauon.sh >/dev/null &
genzathurarc > "$HOME"/.config/zathura/zathurarc &

killall dunst ; notify-send -t 2500 "Reload Complete." "Applied changes."
