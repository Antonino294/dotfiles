#!/bin/bash

cmus-remote -C clear
cmus-remote -C "add ~/Musica"
cmus-remote -C "add ~/Remote/Musica"
cmus-remote -C "update-cache -f"
