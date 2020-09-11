#  Nome File   :  barcolor.py
#  Autore      :  Antonino Carbone
#  Data        :  2020 set 11 10:35:32 
#  Descrizione :  DescrizioneInteressante

import re
import subprocess
import sys

#reg = "^#[a-fA-f0-9]{6}$"

# this one also allows for alpha values at the end of the hex value

reg = "(^#[a-fA-f0-9]{6}$|^#[a-fA-f0-9]{8}$)"

color = input()

result = re.match(reg, color)

if result:
    print(color)
else:
  print("Hex Value is Invalid")	

