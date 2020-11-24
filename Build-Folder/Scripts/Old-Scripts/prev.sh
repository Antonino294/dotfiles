#!/bin/bash

pgrep -x cmus

if [[ $? == 1 ]]
then
        playerctl previous
else
        playerctl -p cmus previous
fi
