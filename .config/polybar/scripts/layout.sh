#!/bin/sh

l=$(herbstclient layout | grep FOCUS | awk '{print $2}')

case $l in
	vertical:) echo  " 充" ;;
	horizontal:) echo " 𤋮" ;;
	max:) echo " 恵" ;;
	grid:) echo " 﩯" ;;
esac
