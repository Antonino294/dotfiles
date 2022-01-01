#!/bin/sh

. $HOME/.cache/wal/colors.sh

sed -i -e "
	s/^fg=.*/fg=$color8/g; \
	s/^find_fg=.*/find_fg=$color6/g; \
	s/^sel_fg=.*/sel_fg=$foreground/g; \
	s/^num_fg=.*/num_fg=$color5/g; \
	" \
	"$HOME"/.config/copyq/themes/wal.ini "$HOME"/.config/copyq/copyq.conf

{ pgrep -x copyq >/dev/null 2>&1 && killall copyq; } ; nohup copyq >/dev/null 2>&1 &
