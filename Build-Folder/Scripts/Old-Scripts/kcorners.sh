#!/bin/bash

CONFIG=$HOME/.config/kwinrc

CURRENT=`kreadconfig --file $CONFIG --group Plugins --key kwin4_effect_shapecornersEnabled`

if [ $CURRENT = "false" ]; then

kwriteconfig --file $CONFIG --group Plugins --key kwin4_effect_shapecornersEnabled true ; qdbus org.kde.KWin /Effects org.kde.kwin.Effects.unloadEffect kwin4_effect_shapecorners ; notify-send --urgency low -a 'ShapeCorners'  -t 1500 "Disattivato"

elif [ $CURRENT = "true" ]; then

kwriteconfig --file $CONFIG --group Plugins --key kwin4_effect_shapecornersEnabled false ; qdbus org.kde.KWin /Effects org.kde.kwin.Effects.loadEffect kwin4_effect_shapecorners ; notify-send --urgency low -a 'ShapeCorners'  -t 1500 "Attivato"

fi
