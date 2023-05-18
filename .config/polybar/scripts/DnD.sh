#!/bin/sh

s=$(dunstctl is-paused 2>/dev/null)

if [ $s = "true" ]
then
	echo " ﮖ"
else
	echo ""
fi
