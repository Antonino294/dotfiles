#!/bin/sh
src=$HOME/.cache/wal/colors-putty.reg

color0=$(grep "Colour0" $src | cut -d\" -f4)
#color1=$(grep "Colour2\"" $src | cut -d\" -f4)
color2=$(grep "Colour7" $src | cut -d\" -f4)
color3=$(grep "Colour8" $src | cut -d\" -f4)
#color4=$(grep "Colour10" $src | cut -d\" -f4)
color5=$(grep "Colour14" $src | cut -d\" -f4)
color6=$(grep "Colour16" $src | cut -d\" -f4)
#color7=$(grep "Colour18" $src | cut -d\" -f4)
#color8=$(grep "Colour20" $src | cut -d\" -f4)

sed -i -e "	s/.*track artist/$color6\t\ttrack artist/g; \
		s/.*artist playing/$color6\t\tartist playing/g; \
		s/.*playing time/$color2\t\tplaying time/g; \
		s/.*menu icons/$color5,75\t\tmenu icons/g; \
		s/.*gallery highlight/$color6\t\tgallery highlight/g; \
		s/.*seek bar/$color5,200\t\tseek bar/g; \
		s/.*volume bar/$color6,180\t\tvolume bar/g; \
		s/.*music vis/$color3\t\tmusic vis/g; \
		s/.*track line/$color0\t\ttrack line/g; \
		s/.*mini text 1/$color0\t\tmini text 1/g; \
		s/.*mini text 2/$color6\t\tmini text 2/g; \
		s/.*column bar background/$color6\t\tcolumn bar background/g" \
		"$HOME"/.var/app/com.github.taiko2k.tauonmb/data/TauonMusicBox/theme/wal2.ttheme

#sed -i -e "s/.*track playing/$color0 track playing/g" $src2
#sed -i -e "s/.*playlist panel/$color1 playlist panel/g" $src2

export DISPLAY=:0
pgrep -x xdotool > /dev/null || { pgrep -x tauonmb && xdotool search --sync --onlyvisible --class "Tauon Music Box" sleep 0.3 key F10 >/dev/null; }
