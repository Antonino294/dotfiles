#!/bin/bash

# god isn't real
while IFS=$'\n' read -r line; do
	[[ (( $(stat -c%s ./"$line") -lt 8000000)) ]] && normal+=( "$line" ) # ok
	[[ (( $(stat -c%s ./"$line") -gt 8000000)) ]] && lines+=( "$line" ) && # too big
		file -i "$line" | grep -q video && ffmpeg -v quiet -y -i "$line" -vcodec libx264 -crf 35 /tmp/"$(basename "$line")" # video
		[[ "${line: -4}" == ".jpg"  || "${line: -4}" == ".jpeg" ]] && jpegoptim "$line" -d /tmp/ -S 8000 -q # jpg/jpeg
		[[ "${line: -4}" == ".png" ]] && convert ./"$line" jpeg:/tmp/"$(basename "$line")" # png
		[[ "${line: -4}" == ".gif" ]] && gifsicle -O3 --colors 64 --careful --lossy=20 --scale 0.5 ./"$line" -o /tmp/"$(basename "$line")" # gif

done

for i in "${!lines[@]}"; do
	echo /tmp/"$(basename "${lines[$i]}")" # print
done

for i in "${!normal[@]}"; do
	echo "${normal[$i]}" # print 2
done
