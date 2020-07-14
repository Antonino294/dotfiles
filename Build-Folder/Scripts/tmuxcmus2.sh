#!/bin/bash

if ps -C cmus > /dev/null; then

status=`cmus-remote -Q |
        grep --text 'status' |
        sed 's/status //'`

artist=`cmus-remote -Q | 
	grep --text '^tag artist' | 
	sed '/^tag artistsort/d' | 
	awk '{gsub("tag artist ", "");print}'`

title=`cmus-remote -Q  | 
	grep --text '^tag title' | 
	sed -e 's/tag title //' |
	awk '{gsub("tag title ", "");print}'`

album=`cmus-remote -Q  | 
	grep --text '^tag album ' | 
	awk '{gsub("tag album ", "");print}'`

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
