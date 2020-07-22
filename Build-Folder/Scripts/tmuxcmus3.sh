#!/bin/bash

if ps -C cmus > /dev/null; then


status=$( cmus-remote -Q | grep status\ | sed 's/status //' )

title=$( cmus-remote -Q | grep tag\ title\ | sed 's/tag title //' )

album=$( cmus-remote -Q | grep tag\ album\ | sed 's/tag album //' )

#artist=$( cmus-remote -Q | grep tag\ artist\ | sed 's/tag artist //' )

lb=${#album}
(( lb > 28)) &&
        album=${album::$(( 28 ))}…

lt=${#title}
(( lt > 29)) &&
        title=${title::$(( 29 ))}…

case $status in
        playing)
                echo "$title   $album"
                ;;
        paused)
                echo "$title   $album"
                ;;
        stopped)
                echo "$title   $album"
                ;;
esac

fi
