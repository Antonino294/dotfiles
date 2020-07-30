#!/usr/bin/fish

set PDIR "$HOME/.config/polybar"
set LAUNCH "polybar-msg cmd restart"

# regex thingy
set reg '^#[a-fA-f0-9]{6}'

read -l -P 'Color Hex: ' color


set -g check (string match -r '^#[a-fA-f0-9]{6}' $color)

if test -n "$check"
        sed -i -e "s/shade1 = .*/shade1 = $color/g" $PDIR/config
        exec polybar-msg cmd restart
else
        echo "Hex Value is invalid."
end
