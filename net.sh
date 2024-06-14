#!/usr/bin/env bash


OPTIONS="WIFI\nCONNECTION\nPOWER"

OPTION=$(echo -e $OPTIONS | rofi -i -dmenu -font 'hack 14' -p "" || exit 1)

if [[ "$OPTION" == "WIFI" ]];then
	NETWORKS=$(nmcli -f SSID device wifi list)
	NETWORK=$(echo -e "$NETWORKS" | tail -n +2 | rofi -i -dmenu -font 'hack 14'  -p "" || exit 1)
	# connect
	NETWORK=$(echo "$NETWORK" | awk '{$1=$1; print}')
	PASSWORD=$(rofi -password -dmenu -p "password")
	nmcli device wifi connect "$NETWORK" password "$PASSWORD"
elif [[ "$OPTION" == "CONNECTION" ]];then
	echo "connection"
elif [[ "$OPTION" == "POWER" ]];then
	echo "power"
fi
