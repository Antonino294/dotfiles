#!/bin/bash

        case "$1" in
                play) playerctl --player=cmus,tauon,plasma-browser-integration,playerctld play-pause ;;
                next) playerctl --player=cmus,tauon,plasma-browser-integration,playerctld next ;;
                prev) playerctl --player=cmus,tauon,plasma-browser-integration,playerctld previous ;;
                forw) playerctl --player=cmus,tauon,plasma-browser-integration,playerctld position 10+ ;;
                back) playerctl --player=cmus,tauon,plasma-browser-integration,playerctld position 10- ;;
        esac

tmux refresh-client
