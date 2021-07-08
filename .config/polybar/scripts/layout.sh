#!/bin/sh

l=$(herbstclient layout | grep FOCUS | awk '{print $2}')

case $l in
	vertical:) echo "[-]" ;;
	horizontal:) echo "[|]" ;;
	max:) echo "[*]" ;;
	grid:) echo "[+]" ;;
esac
