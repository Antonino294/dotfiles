#!/bin/sh

pad=$(herbstclient get_attr monitors.focus.pad_up)

[ "$pad" = "29" ] && polybar-msg cmd toggle >/dev/null && herbstclient pad 0 "0" "0" "0"
[ "$pad" != "29" ] && polybar-msg cmd toggle >/dev/null && herbstclient pad 0 "29" "0" "0"


