#!/bin/sh

. $HOME/.cache/wal/colors.sh; port=$(cat $HOME/Build-Folder/port_number)

sed -i -e "	s/theme\[main_fg\]=.*/theme\[main_fg\]=\"$foreground\"/g; \
		s/theme\[title\]=.*/theme\[title\]=\"$color7\"/g; \
		s/theme\[hi_fg]=.*/theme\[hi_fg]=\"$color5\"/g; \
		s/theme\[selected_bg]=.*/theme\[selected_bg]=\"$color5\"/g; \
		s/theme\[selected_fg]=.*/theme\[selected_fg]=\"$color15\"/g; \
		s/theme\[inactive_fg]=.*/theme\[inactive_fg]=\"$color3\"/g; \
		s/theme\[proc_misc]=.*/theme\[proc_misc]=\"$color4\"/g; \
		s/theme\[cpu_box]=.*/theme\[cpu_box]=\"$color8\"/g; \
		s/theme\[mem_box]=.*/theme\[mem_box]=\"$color8\"/g; \
		s/theme\[net_box]=.*/theme\[net_box]=\"$color8\"/g; \
		s/theme\[proc_box]=.*/theme\[proc_box]=\"$color8\"/g; \
		s/theme\[div_line]=.*/theme\[div_line]=\"$color8\"/g; \
		s/theme\[temp_start]=.*/theme\[temp_start]=\"$color5\"/g; \
		s/theme\[temp_mid]=.*/theme\[temp_mid]=\"$color6\"/g; \
		s/theme\[temp_end]=.*/theme\[temp_end]=\"$color7\"/g; \
		s/theme\[cpu_start]=.*/theme\[cpu_start]=\"$color5\"/g; \
		s/theme\[cpu_mid]=.*/theme\[cpu_mid]=\"$color6\"/g; \
		s/theme\[cpu_end]=.*/theme\[cpu_end]=\"$color7\"/g; \
		s/theme\[free_start]=.*/theme\[free_start]=\"$color5\"/g; \
		s/theme\[free_mid]=.*/theme\[free_mid]=\"$color6\"/g; \
		s/theme\[free_end]=.*/theme\[free_end]=\"$color7\"/g; \
		s/theme\[cached_start]=.*/theme\[cached_start]=\"$color5\"/g; \
		s/theme\[cached_mid]=.*/theme\[cached_mid]=\"$color6\"/g; \
		s/theme\[cached_end]=.*/theme\[cached_end]=\"$color7\"/g; \
		s/theme\[available_start]=.*/theme\[available_start]=\"$color5\"/g; \
		s/theme\[available_mid]=.*/theme\[available_mid]=\"$color6\"/g; \
		s/theme\[available_end]=.*/theme\[available_end]=\"$color7\"/g; \
		s/theme\[used_start]=.*/theme\[used_start]=\"$color5\"/g; \
		s/theme\[used_mid]=.*/theme\[used_mid]=\"$color6\"/g; \
		s/theme\[used_end]=.*/theme\[used_end]=\"$color7\"/g; \
		s/theme\[download_start]=.*/theme\[download_start]=\"$color5\"/g; \
		s/theme\[download_mid]=.*/theme\[download_mid]=\"$color6\"/g; \
		s/theme\[download_end]=.*/theme\[download_end]=\"$color7\"/g; \
		s/theme\[upload_start]=.*/theme\[upload_start]=\"$color5\"/g; \
		s/theme\[upload_mid]=.*/theme\[upload_mid]=\"$color6\"/g; \
		s/theme\[upload_end]=.*/theme\[upload_end]=\"$color7\"/g" \
		"$HOME"/.config/btop/themes/wal.theme

scp -P $port .config/btop/themes/wal.theme antonino@192.168.1.192:.config/btop/themes/wal.theme &>/dev/null
