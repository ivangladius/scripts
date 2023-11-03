#/usr/bin/bash 

OUTPUT=`find ~ -type f -iname "*.pdf" | rofi -dmenu -font 'hack 14' -i`
evince "`echo "$OUTPUT"`"
 





