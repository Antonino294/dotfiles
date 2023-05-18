#!/bin/bash

ps -C tauonmb > /dev/null || ps -C cmus > /dev/null &&

#artist=$( playerctl --player=cmus,tauon metadata artist 2>&1 | sed 's/No player could handle this command//g' )
title=$( playerctl --player=cmus,tauon metadata title 2>&1 | sed 's/No player could handle this command//g' )
album=$( playerctl --player=cmus,tauon metadata album 2>&1 | sed 's/No player could handle this command//g' )

zscroll -l 15 --delay 5 \
	--match-command "playerctl --player=cmus,tauon status" \
	--match-text "Playing" "--before-text ' '" \
	--match-text "Paused" "--before-text ' ' --scroll 0" \
	--update-check true "echo $title - $album" -n false
