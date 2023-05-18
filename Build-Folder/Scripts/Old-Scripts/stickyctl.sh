#!/bin/bash

VERSION="0.0.2"

usage() {
    echo 'stickyctl'
    echo
    echo "Version: $VERSION"
    echo
    echo 'stickyctl is a script to manage making windows (floating'
    echo 'or tiled) sticky in herbstluftwm so it is visible on any'
    echo 'tag.'
    echo
    echo 'Herbstluftwm autostart requirements:'
    echo 'The following attributes need to be defined in the'
    echo 'autostart file. This holds the window ID of the sticky'
    echo 'window.  It should be of type string'
    echo '    my_sticky'
    echo
    echo 'Usage:'
    echo '    stick        Makes the focused window sticky.'
    echo
    echo '    unstick      Clears the window ID and un-stick the'
    echo '                 window.'
    echo
    echo '    get-sticky   Called when switching tags and gets'
    echo '                 the sticky window and pulls it to the'
    echo '                 current tag.'
    echo
    echo '    status       Shows if a window is sticky.  Use with'
    echo '                 status bars.'
    echo
    echo '    locate       Focuses the sticky window.'
    echo
    echo '    reset        Resets the my_sticky attribute in case'
    echo '                 the sticky window is closed without'
    echo '                 un-sticking it.'

    exit 0
}

function hc() {
    herbstclient "$@"
}

case "$@" in
    stick)
        hc set_attr my_sticky $(hc attr clients.focus.winid)
        notify-send -u normal "Sticky" "Window is <b><span foreground=\"#c0f83e\">STICKY</span></b>"
        ;;
    unstick)
        hc set_attr my_sticky ''
        notify-send -u normal "Sticky" "Window is <b><span foreground=\"#c0f83e\">NOT STICKY</span></b>"
        ;;
    get-sticky)
        hc bring $(hc attr my_sticky)
        ;;
    status)
        [[ -n $(hc attr my_sticky) ]] && echo "%{F#ffff52} %{F-}  |" ||  echo ""
        ;;
    locate)
        hc jumpto "$(hc attr my_sticky)"
        ;;
    reset)
        hc set_attr my_sticky ''
        notify-send -u critical -t 5000 "Sticky" "Sticky-Control is <b><span foreground=\"#ff4a52\">RESET</span></b>"
        ;;
    *)
        usage
        ;;
esac
