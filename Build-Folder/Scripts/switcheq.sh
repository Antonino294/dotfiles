#!/bin/bash

# Simple script to switch equalizers if you use a different pair of headphones or speakers.
# If you for example plug in speakers: ./switcheq.sh 0 # this will disable any EQ.
# If you plug in USB headset like the PC373d: ./switcheq.sh 3
# Modify this script and your eq.txt files accordingly to your setup.

headphones=1
echo -n "Setting EQ to "
if [[ $1 == 1 || $1 == M40X || $1 == m40 || $1 == headphones ]]; then
	echo "Audio-Techinca M40X."
	notify-send -t 2000 "EQ Settings" "EQ Settings changed to <b><span foreground=\"#ff4a52\">M40X</span></b>"
	amixer -q sset Master 75
	headphones=1

elif [[ $1 == 2 || $1 == T2 || $1 == tin || $1 == t2 ]]; then
	echo "TinAudio T2."
	notify-send -t 2000 "EQ Settings" "EQ Settings changed to <b><span foreground=\"#ff4a52\">Tin T2</span></b>"
	amixer -q sset Master 70
	headphones=2

elif [[ $1 == 3 || $1 == T2B || $1 == tinB || $1 == t2B ]]; then
	echo "TinAudio T2 (Alt)."
	notify-send -t 2000 "EQ Settings" "EQ Settings changed to <b><span foreground=\"#ff4a52\">Tin T2 (Alt)</span></b>"
	amixer -q sset Master 70
	headphones=3

elif [[ $1 == 0 || $1 == none || $1 == off || $1 == disable ]]; then
	echo "Disabling EQ."
	notify-send -t 2000 "EQ Settings" "EQ Settings <b><span foreground=\"#ff4a52\">Disabled</span></b>"
	amixer -q sset Master 63
	headphones=0
fi

eqdir=~/.config/ladspa_dsp
eqfile="eq$headphones.txt"
if [[ ! -f $eqdir/$eqfile ]] || [[ ! -f $eqdir/config ]]; then
	echo "Missing config or eq file."
	exit 1
fi

sed -i "s/eq[0-9]*.txt/$eqfile/" $eqdir/config

gstat=$(pgrep -x glava)
pkill -USR1 cava
systemctl --user restart pulseaudio.service
polybar-msg cmd restart > /dev/null 2>&1
[[ -n "$gstat" ]] && glava --desktop
