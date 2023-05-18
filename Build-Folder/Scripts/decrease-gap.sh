#!/bin/bash

old=`bspc config -d focused window_gap`

new=`expr $old - 6`

bspc config -d focused window_gap $new

