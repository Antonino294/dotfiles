#!/bin/bash

        case "$1" in
                play) playerctl --player=cmus,tauon,%any play-pause ;;
                next) playerctl --player=cmus,tauon,%any next ;;
                prev) playerctl --player=cmus,tauon,%any previous ;;
                forw) playerctl --player=cmus,tauon,%any position 10+ ;;
                back) playerctl --player=cmus,tauon,%any position 10- ;;
        esac
