#!/bin/bash

ps -C tauonmb > /dev/null || ps -C cmus > /dev/null &&

status=$( playerctl --player=cmus,tauon status 2>&1 | sed 's/No player could handle this command//g' )
title=$( playerctl --player=cmus,tauon metadata title 2>&1 | sed 's/No player could handle this command//g' )
album=$( playerctl --player=cmus,tauon metadata album 2>&1 | sed 's/No player could handle this command//g' )

lb=${#album}
(( lb > 20)) && album=${album::$(( 20 ))}…

lt=${#title}
(( lt > 22)) && title=${title::$(( 22 ))}…

case $status in
        Playing) echo "$title   $album" ;;
        Paused) echo "$title   $album" ;;
        Stopped) [[ $title ]] &&  echo "$title   $album" || echo "𝅘𝅥𝅮 nothing is playing... 𝅘𝅥𝅮" ;;
esac
