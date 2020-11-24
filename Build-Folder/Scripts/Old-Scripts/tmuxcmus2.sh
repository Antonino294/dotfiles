#!/bin/bash

if ps -C cmus > /dev/null; then


status=$( cmus-remote -Q | grep status\ | sed 's/status //' )

title=$( cmus-remote -Q | grep tag\ title\ | sed 's/tag title //' )

album=$( cmus-remote -Q | grep tag\ album\ | sed 's/tag album //' )

artist=$( cmus-remote -Q | grep tag\ artist\ | sed 's/tag artist //' )



case $status in
        playing)
                echo "$title ▶ $album"
                ;;
        paused)
                echo "$title ‖ $album"
                ;;
        stopped)
                echo "$title ■ $album"
                ;;
esac

fi
