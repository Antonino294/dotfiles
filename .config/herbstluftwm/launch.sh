#!/usr/bin/env bash

killall -q polybar

polybar --reload main &

#herbstclient pad $monitor "29" "0" "0"
herbstclient pad 0 "29" "0" "0"
