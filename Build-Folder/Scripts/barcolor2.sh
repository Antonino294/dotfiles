#!/bin/bash

color=$(hex)

if [[ $color != "Hex value is not valid." ]]
then
        sed -i -e "s/shade1 = .*/shade1 = $color/g" $HOME/.config/polybar/config
#        exec polybar-msg cmd restart
        sleep 0.6; herbstclient pad 0 "29" "0" "0" 
else
        echo "Hex Value is Invalid"
        exit
fi

