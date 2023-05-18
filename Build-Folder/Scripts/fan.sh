#!/bin/bash

mode=$(sudo acer_ec \?= 0x93 | awk '{print $3}')
ov=$(sudo acer_ec \?= 0x94 | awk '{print $3}')

if [[ $1 -eq "auto" ]]
then
	sudo acer_ec := 0x93 0x04
else
	if [[ $mode -ne "0x14" ]]
	then
		sudo acer_ec := 0x93 0x14
	fi
	nv=$(printf "0x%X" $((ov - $1)))
fi

sudo acer_ec := 0x94 "$nv"
[[ $? -ne 0 ]] && echo "Value out of Range. Setting to half speed." && sudo acer_ec := 0x94 0x80
