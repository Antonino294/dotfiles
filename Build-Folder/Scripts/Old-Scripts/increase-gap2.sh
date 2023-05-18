#!/bin/bash

old=`herbstclient get window_gap`

new=`expr $old + 6`

herbstclient set window_gap $new
