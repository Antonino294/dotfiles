#!/usr/bin/env bash
# Display currently playing song from cmus
# Requires cmus

# colors
active="#cc241d"
inactive="#fb3333"

np_string=""

trunc() {
    max_length=$1
    text=$2
    length=${#text}
    (( length > max_length )) &&
        text=${text::$(( max_length ))}...
    echo "$text"
}

if pgrep -x "cmus" > /dev/null
then
	status=$( cmus-remote -Q | grep status\ | sed 's/status //' )
	artist=$( cmus-remote -Q | grep tag\ artist\ | sed 's/tag artist //' )
	title=$( cmus-remote -Q | grep tag\ title\ | sed 's/tag title //' )

	np_string="$title - $artist"
	np_string=$( trunc 35 "$np_string" )

	spc=$(( $(( 32 - ${#np_string} ))/2 ))
	spc="$( printf "%${spc}s" )"

	if [[ "$status" = *playing* ]]
	then
		echo -ne "%{F#FF0000}%{F#FFFFFF}PAUSE"
	elif [[ "$status" = *paused* ]]
	then
		echo -ne "PLAY"
	elif [[ "$status" = *stopped* ]]
	then
		echo -ne "START"
	fi

else
	echo 
fi
