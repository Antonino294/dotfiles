#!/bin/bash
# baraction.sh for spectrwm status bar

## DATE
dte() {
  dte="$(date +"%A, %B %d %l:%M%p")"
  echo -e "$dte"
}

## DISK
hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "D: $hdd"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "R:$mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU: $cpu %"
}

## VOLUME
vol() {
    vol=`amixer get Master | awk -F'[][]' 'END{ print $2" | "$4 }'`
    echo -e "VL: $vol"
}

## Battery
bat(){
        bat=`echo  $(cat /sys/class/power_supply/BAT0/capacity)%`
        echo -e "B:$bat"
}

SLEEP_SEC=3
#loops forever outputting a line every SLEEP_SEC secs
while :; do
        echo "+@fg=1; +@fn=1;+@fn=0; $(cpu) +@fg=0; | +@fg=2;  +@fn=1;+@fn=0; $(mem) | $(hdd) +@fg=0; | +@fg=3; +@fn=1;+@fn=0; $(bat) +@fg=0; | +@fg=4; +@fn=1;+@fn=0; $(vol) +@fg=0; |"
	#sleep $SLEEP_SEC
done

