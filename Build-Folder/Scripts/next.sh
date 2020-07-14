#!/bin/bash

pgrep -x cmus

if [[ $? == 1 ]]
then
        playerctl next
else
        playerctl -p cmus next
fi
