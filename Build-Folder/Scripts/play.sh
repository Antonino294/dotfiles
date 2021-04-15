#!/bin/bash

        case "$1" in
                play) playerctl --player=cmus,tauon,playerctld play-pause ;;
                next) playerctl --player=cmus,tauon,playerctld next ;;
                prev) playerctl --player=cmus,tauon,playerctld previous ;;
                forw) playerctl --player=cmus,tauon,playerctld position 10+ ;;
                back) playerctl --player=cmus,tauon,playerctld position 10- ;;
        esac

	tmux refresh-client
