import re
import subprocess
import sys

#reg = "^#[a-fA-f0-9]{6}$"

# this one also allows for alpha values at the end of the hex value

reg = "(^#[a-fA-f0-9]{6}$|^#[a-fA-f0-9]{8}$)"

color = input("Color Hex: ")

result = re.match(reg, color)

if result:
    subprocess.call(["sed -i -e 's/shade1 = .*/shade1 = " + color + "/g' ~/.config/polybar/config"], shell=True)
    subprocess.call(["exec polybar-msg cmd restart"], shell=True)
else:
  print("Hex Value is Invalid")	
