#!/usr/bin/env bash

NEWFILE="$HOME/backups/backup_$(date +%Y_%m_%d_%H_%M).tar.xz" 

tar --xz -cf "$NEWFILE" -C /home/max/ projects &>/dev/null
scp "$NEWFILE" alien@$VPS4:~/backups/

