#!/bin/bash

pad_old=`herbstclient get frame_padding`
gap_old=`herbstclient get window_gap`

case "$1" in
        gap)
                case "$2" in
                +) herbstclient set window_gap `expr $gap_old + 6` ;;
                -) herbstclient set window_gap `expr $gap_old - 6` ;;
        esac ;;
        pad)
                case "$2" in
                +) herbstclient set frame_padding `expr $pad_old + 6` ;;
                -) herbstclient set frame_padding `expr $pad_old - 6` ;;
        esac ;;
esac
