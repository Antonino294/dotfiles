#!/bin/bash

ps -C tauonmb > /dev/null || ps -C spotify > /dev/null || playerctl -l | grep kdeconnect > /dev/null &&

kdedevice=$(playerctl -l | grep kdeconnect)

status=$(playerctl --player=spotify,tauon,"$kdedevice" status)
title=$(playerctl --player=spotify,tauon,"$kdedevice" metadata title)
album=$(playerctl --player=spotify,tauon,"$kdedevice" metadata album)

lb=${#album}
(( lb > 20)) && album=${album::$(( 20 ))}…

lt=${#title}
(( lt > 22)) && title=${title::$(( 22 ))}…

case $status in
        Playing) echo "$title 契$album" ;;
        Paused) echo "$title  $album" ;;
        Stopped) [[ $title ]] &&  echo "$title 栗$album" || echo "𝅘𝅥𝅮 nothing is playing... 𝅘𝅥𝅮" ;;
esac
