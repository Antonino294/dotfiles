#!/bin/sh
xrdb -load .cache/wal/colors.Xresources

while getopts "hrm:b:" o; do
	case "${o}" in
		r) r_flag=1 ;;
		m) m_flag="${OPTARG}" ;;
		b) b_flag="${OPTARG}" ;;
		h)
			printf  "usage:\n"
			printf  " -h\tshow this message\n"
			printf  " -r\tchoose random image\n"
			printf  " -m\tchoose feh bg mode (fill/center/tile/scale)\n"
			printf  " -b\twal backend (wal/haishoku/colorz/colorthief)\n"
			exit 0
			;;
		*)
			printf "Unknown option specified. Exiting...\n"
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

	auto)	wal --backend wal -i "$file" -stne --saturate 0.4 -q ||
		wal --backend haishoku -i "$file" -stne -q ||
		wal --backend colorz -i "$file" -stne --saturate 0.6 -q ||
		wal --backend colorthief -i "$file" -stne -q ;;

	*) wal --backend $(printf "wal\nhaishoku\ncolorz\ncolorthief" | rofi -dmenu) -i "$file" -stne --saturate 0.4 -q;;
esac

. "$HOME"/.cache/wal/colors.sh

sed -i -e "s/#define color1 #.*/#define color1 $color15/g; \
	s/#define color2 #.*/#define color2 $color13/g" \
	"$HOME"/.config/glava/bars.glsl

sed -i -e "s/ gradient_color_1 = '#.*'/ gradient_color_1 = '$color13'/g; \
	s/ gradient_color_2 = '#.*'/ gradient_color_2 = '$color15'/g" \
	"$HOME"/.config/cava/config

sed -i -e "s/shade1 = .*/shade1 = $color13/g; \
	s/shade2 = .*/shade2 = $color15/g; \
	s/shade3 = .*/shade3 = $color4/g" \
	"$HOME"/.config/polybar/config

sed -i -e "s/\.border_color = .*/.border_color = \"$color13\",/g; \
	s/\.background_color = .*/.background_color = \"$color0\",/g " \
	"$HOME"/Build-Folder/xmenu/config.h

sed -i -e "s/hc attr theme.active.color .*/hc attr theme.active.color \'$color13\'/g; \
	s/hc attr theme.floating.active.color .*/hc attr theme.floating.active.color \'$color13\'/g; \
	s/hc attr theme.normal.color .*/hc attr theme.normal.color \'$color15\'/g" \
	"$HOME"/.config/herbstluftwm/autostart

sed -i -e "s/background = \"#.*\"/background = \"$color0\"/g; \
	s/frame_color = \"#.*\"/frame_color = \"$color13\"/g; \
	s/highlight = \"#.*\"/highlight = \"$color15\"/g" \
	"$HOME"/.config/dunst/dunstrc

herbstclient attr theme.active.color "$color13"
herbstclient attr theme.floating.active.color "$color13"
herbstclient attr theme.normal.color "$color15"

pgrep -x cava >/dev/null && pkill -USR1 cava
pgrep -x glava >/dev/null && pkill -USR1 glava

make install -C "$HOME"/Build-Folder/xmenu/ >/dev/null
pywalfox update >/dev/null
"$HOME"/Build-Folder/Scripts/waltauon.sh >/dev/null &
genzathurarc > "$HOME"/.config/zathura/zathurarc &

#pkill dunst ; { dunst & disown; } && dunstify -t 2500 "Reload Complete." "Applied changes."
pkill dunst ; nohup dunst >/dev/null 2>&1 & sleep 0.10 && dunstify -t 2500 "Reload Complete." "Applied changes." # <- what in the fuck is this
