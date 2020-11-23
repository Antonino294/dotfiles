#!/bin/bash

value=$(grep 'strength =' ~/.config/picom/picom.conf | awk '{print $3}')

if [[ $value = "5;" ]]
then
        sed -i '/strength = 5;/c\strength = 0;' ~/.config/picom/picom.conf
else
        sed -i '/strength = 0;/c\strength = 5;' ~/.config/picom/picom.conf
fi
