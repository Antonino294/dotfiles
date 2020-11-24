#!/bin/bash

if ps -C tauonmb > /dev/null || ps -C cmus > /dev/null; then

status=$( playerctl --player=playerctld status 2>&1 | sed 's/No player could handle this command//g' )

title=$( playerctl --player=playerctld metadata --format '{{ title }}' 2>&1 | sed 's/No player could handle this command//g' )

album=$( playerctl --player=playerctld metadata --format '{{ album }}' 2>&1 | sed 's/No player could handle this command//g' )

#artist=$( cmus-remote -Q | grep tag\ artist\ | sed 's/tag artist //' )

lb=${#album}
(( lb > 28)) &&
        album=${album::$(( 28 ))}…

lt=${#title}
(( lt > 29)) &&
        title=${title::$(( 29 ))}…

case $status in
        Playing)
                echo "$title   $album"
                ;;
        Paused)
                echo "$title   $album"
                ;;
        Stopped)
                [ $title ] &&  echo "$title   $album" || echo "𝅘𝅥𝅮 nothing is playing... 𝅘𝅥𝅮"
                ;;
esac

fi
