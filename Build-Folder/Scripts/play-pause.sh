#!/bin/bash

pgrep -x cmus

if [[ $? == 1 ]]
then
        playerctl play-pause
else
        playerctl -p cmus play-pause
fi
