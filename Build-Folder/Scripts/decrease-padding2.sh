#!/bin/bash

old=`herbstclient get frame_padding`

new=`expr $old - 6`

herbstclient set frame_padding $new

