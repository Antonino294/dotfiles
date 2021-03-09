#!/bin/sh
BAT="$(acpi -i | head -n1 | awk '{print $4}')"
VOL="$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')"
BRI="$(brightnessctl i | grep % | sed 's/.*(\(.*\))/\1/')"

cat <<EOF | xmenu | sh &
Rofi		rofi -show drun -modi run,drun -show-icons
Browser		firefox
Music		flatpak run com.github.taiko2k.tauonmb & disown
Terminal	kitty
Discord		discord

File Manager	dolphin
Soulseek	nicotine
Minecraft	java -jar Build-Folder/Giochi/ShiginimaSE_v4400/linux_osx/Shiginima\ Launcher\ SE.v4400.jar
Kill Program	xkill

Shutdown	poweroff
Reboot		reboot

BAT:$BAT VOL:$VOL BRI:$BRI
$(date +'%a %d/%m %R')
EOF
