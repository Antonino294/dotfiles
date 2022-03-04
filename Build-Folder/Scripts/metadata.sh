#!/bin/bash

ps -C tauonmb > /dev/null || ps -C cmus > /dev/null || playerctl -l | grep kdeconnect > /dev/null &&

kdedevice=$(playerctl -l | grep kdeconnect)

status=$(playerctl --player=cmus,tauon,"$kdedevice" status)
title=$(playerctl --player=cmus,tauon,"$kdedevice" metadata title)
album=$(playerctl --player=cmus,tauon,"$kdedevice" metadata album)

lb=${#album}
(( lb > 20)) && album=${album::$(( 20 ))}…

lt=${#title}
(( lt > 22)) && title=${title::$(( 22 ))}…

case $status in
        Playing) echo "$title   $album" ;;
        Paused) echo "$title   $album" ;;
        Stopped) [[ $title ]] &&  echo "$title   $album" || echo "𝅘𝅥𝅮 nothing is playing... 𝅘𝅥𝅮" ;;
esac
