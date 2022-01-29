#!/bin/sh

s=$(dunstctl is-paused)

if [ $s = "true" ]
then
	echo " ﮖ"
else
	echo ""
fi
