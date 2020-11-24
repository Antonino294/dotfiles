#!/usr/bin/fish
# Define Title,Album and if the song is playing

set -g STATUS (qdbus 'org.mpris.MediaPlayer2.cmus' /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus)
set -g TITLE (qdbus 'org.mpris.MediaPlayer2.cmus' /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep -F "xesam:title: " | cut -d: -f3-4 | cut -c 2-)
set -g ARTIST (qdbus 'org.mpris.MediaPlayer2.cmus' /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep -F "xesam:albumArtist: " | cut -d: -f3-4 | cut -c 2-)
set -g ALBUM (qdbus 'org.mpris.MediaPlayer2.cmus' /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep -F "xesam:album: " | cut -d: -f3-4 | cut -c 2-)
#set TEST (qdbus 'org.mpris.MediaPlayer2.cmus' /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus)

if test "$STATUS" = "Playing"
   set STATUS " ▶ "

else if test "$STATUS" = "Paused"
   set STATUS " ‖ " 

else if test "$STATUS" = "Stopped"
   set STATUS " ■ "
#else if test "$STATUS" != "Playing" -o "Paused" -o "Stopped"
end

if test "$STATUS" = "Playing" -o "Paused" -o "Stopped"
    echo "$TITLE$STATUS$ALBUM"
end
