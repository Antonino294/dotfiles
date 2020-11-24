#!/bin/bash

pgrep -x cmus

if [[ $? == 1 ]]
then
        playerctl position 10+
else
        playerctl -p cmus position 10+
fi
