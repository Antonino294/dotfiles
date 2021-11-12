#!/bin/sh

pad_old=$(herbstclient get frame_gap); gap_old=$(herbstclient get window_gap); cmd="herbstclient set"

case "$1" in
	gap)
		case "$2" in
			+) [ "$gap_old" -lt 200 ] && [ "$pad_old" -lt 200 ] && $cmd window_gap $((gap_old + 6)) ;;
			-) [ "$gap_old" -gt -6 ] && [ "$pad_old" -gt -6 ] && $cmd window_gap $((gap_old - 6)) ;;
		esac ;;
	pad)
		case "$2" in
			+) [ "$pad_old" -lt 200 ] && [ "$gap_old" -lt 200 ] && $cmd frame_gap $((pad_old + 6)) ;;
			-) [ "$pad_old" -gt -6 ] && [ "$gap_old" -gt -6 ] && $cmd frame_gap $((pad_old - 6)) ;;
		esac ;;
esac
