#!/bin/bash

CONFIG=$HOME/.config/kwinrc

CURRENT=$(kreadconfig --file $CONFIG --group Plugins --key grid-tilingEnabled)

if [ $CURRENT = "false" ]; then

kwriteconfig --file $CONFIG --group Plugins --key grid-tilingEnabled true ; qdbus org.kde.KWin /KWin reconfigure ; notify-send --urgency low -a 'Tiling'  -t 1500 "Attivato"

elif [ $CURRENT = "true" ]; then

kwriteconfig --file $CONFIG --group Plugins --key grid-tilingEnabled false ; qdbus org.kde.KWin /KWin reconfigure ; notify-send --urgency low -a 'Tiling'  -t 1500 "Disattivato"

fi
