#!/bin/bash

while true; do

node=$(herbstclient get_attr clients.focus.winid)
status=$(herbstclient get_attr clients.focus.floating)

        case "$status" in
            false) xprop -id "$node" -remove _COMPTON_SHADOW;;
            true) xprop -id "$node" -f _COMPTON_SHADOW 32c -set _COMPTON_SHADOW 1;;
        esac

        sleep 0.3;

done
