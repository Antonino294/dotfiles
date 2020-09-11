#!/bin/bash

color=$(python3 $HOME/Build-Folder/Scripts/barcolor.py)

if [[ $color != "Hex Value is Invalid" ]]
then
        sed -i -e "s/shade1 = .*/shade1 = $color/g" $HOME/.config/polybar/config
        exec polybar-msg cmd restart
else
        echo "Hex Value is Invalid"
        exit
fi
