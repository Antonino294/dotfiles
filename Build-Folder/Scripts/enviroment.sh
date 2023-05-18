#!/bin/bash

check=$(wmctrl -m | grep 'Name' | cut -d':' -f2)

if [[ $check != "kwin" ]]
        then
export QT_QPA_PLATFORMTHEME="qt5ct"
        fi
