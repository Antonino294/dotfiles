#!/bin/bash

CONFIG=$HOME/.config/kwinrc

CURRENT=$(kreadconfig --file $CONFIG --group Plugins --key krohnkiteEnabled)

if [ $CURRENT = "false" ]; then

kwriteconfig --file $CONFIG --group Plugins --key krohnkiteEnabled true ; qdbus org.kde.KWin /KWin reconfigure ; notify-send --urgency low -a 'Tiling (Krohnkite)'  -t 1500 "Attivato"

elif [ $CURRENT = "true" ]; then

        kwriteconfig --file $CONFIG --group Plugins --key krohnkiteEnabled false ; qdbus org.kde.KWin /KWin reconfigure ; notify-send --urgency low -a 'Tiling (Krohnkite)'  -t 1500 "Disattivato"

fi
