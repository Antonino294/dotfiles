#!/bin/bash

old=`herbstclient get frame_padding`

new=`expr $old - 10`

herbstclient set frame_padding $new

