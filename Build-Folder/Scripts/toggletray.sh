#!/bin/bash

value=$(grep 'tray-maxsize = ' ~/.config/polybar/config.ini | awk '{print $3}')

if [[ $value = '0' ]]
then
	sed -i -e 's/tray-maxsize = 0/tray-maxsize = 16/g' ~/.config/polybar/config.ini
else
        sed -i -e 's/tray-maxsize = 16/tray-maxsize = 0/g' ~/.config/polybar/config.ini
fi
