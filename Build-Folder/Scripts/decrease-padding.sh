#!/bin/bash

old1=`bspc config -d focused top_padding`
old2=`bspc config -d focused left_padding`
old3=`bspc config -d focused right_padding`
old4=`bspc config -d focused bottom_padding`

new1=`expr $old1 - 6`
new2=`expr $old2 - 6`
new3=`expr $old3 - 6`
new4=`expr $old4 - 6`

bspc config -d focused top_padding $new1
bspc config -d focused left_padding $new2
bspc config -d focused right_padding $new3
bspc config -d focused bottom_padding $new4
