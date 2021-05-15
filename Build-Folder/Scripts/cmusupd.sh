#!/bin/bash

cmus-remote -C clear
cmus-remote -C "add ~/Musica"
cmus-remote -C "add ~/Remotefs/Musica"
cmus-remote -C "update-cache -f"
