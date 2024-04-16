#/bin/bash 

OUTPUT=`find ~ -type f -iname "*.pdf" | rofi -dmenu -font 'hack 14' -i` || exit 1
evince "`echo "$OUTPUT"`"
 
