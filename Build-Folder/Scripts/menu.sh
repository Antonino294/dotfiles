#!/bin/sh
BAT="$(acpi -i | head -n1 | awk '{print $4}')"
VOL="$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')"
B="$(cat /sys/class/backlight/intel_backlight/brightness)"
BRI="$(echo "scale=2; ($B/4437)*100" | bc | sed 's!\.0*$!!' )"

cat <<EOF | xmenu | sh &
Apps		rofi -show drun -modi run,drun -show-icons
Browser		brave-browser
Music		flatpak run com.github.taiko2k.tauonmb & disown
Terminal	kitty
Discord		discord
Minecraft	MC

File Manager	dolphin
Clipboard	copyq menu
Kill Program	xkill

Shutdown	poweroff
Reboot		reboot

BAT:$BAT VOL:$VOL BRI:$BRI%
$(date +'%a %R %d/%m')
EOF
