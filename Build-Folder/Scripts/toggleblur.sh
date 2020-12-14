#!/bin/bash

value=$(grep ' method = "' ~/.config/picom/picom.conf | awk '{print $3}')

if [[ $value = '"dual_kawase";' ]]
then
        sed -i '/ method = "dual_kawase";/c\ method = "none";' ~/.config/picom/picom.conf
else
        sed -i '/ method = "none";/c\ method = "dual_kawase";' ~/.config/picom/picom.conf
fi
