#!/bin/sh
src=/home/antonino/.cache/wal/colors-putty.reg

color0=$(grep "Colour0" $src | cut -d\" -f4)
#color1=$(grep "Colour2\"" $src | cut -d\" -f4)
color2=$(grep "Colour7" $src | cut -d\" -f4)
color3=$(grep "Colour8" $src | cut -d\" -f4)
#color4=$(grep "Colour10" $src | cut -d\" -f4)
color5=$(grep "Colour14" $src | cut -d\" -f4)
color6=$(grep "Colour16" $src | cut -d\" -f4)
#color7=$(grep "Colour18" $src | cut -d\" -f4)
#color8=$(grep "Colour20" $src | cut -d\" -f4)

sed -i -e "	s/.*track artist/$color6 track artist/g; \

		s/.*artist playing/$color6 artist playing/g; \

		s/.*playing time/$color2 playing time/g; \

		s/.*menu icons/$color5,75 menu icons/g; \

		s/.*gallery highlight/$color6 gallery highlight/g; \

		s/.*seek bar/$color5,200 seek bar/g; \

		s/.*volume bar/$color6,180 volume bar/g; \

		s/.*music vis/$color3 music vis/g; \

		s/.*track line/$color0 track line/g" \
		"$HOME"/.var/app/com.github.taiko2k.tauonmb/data/TauonMusicBox/theme/wal2.ttheme

#sed -i -e "s/.*track playing/$color0 track playing/g" $src2
#sed -i -e "s/.*playlist panel/$color1 playlist panel/g" $src2
#ps -C tauonmb && d=$(xdotool get_desktop) && xdotool search --class "Tauon Music Box" windowactivate sleep 0.35 key --window %@ F10 set_desktop "$d"

ps -C tauonmb && xdotool search --sync --onlyvisible --class "Tauon Music Box" key F10
