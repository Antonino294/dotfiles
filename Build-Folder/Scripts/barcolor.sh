#!/bin/bash

color=$(python3 $HOME/Build-Folder/Scripts/barcolor.py)

if [[ $color != "Hex Value is Invalid" ]]
then
        sed -i -e "s/shade1 = .*/shade1 = $color/g" $HOME/.config/polybar/config
#        exec polybar-msg cmd restart
        sleep 0.6; herbstclient pad 0 "29" "0" "0" 
else
        echo "Hex Value is Invalid"
        exit
fi
