#!/bin/bash

# set -xe

out=$(xrandr | grep " connected" | awk '{print $1}')

PRIMARY_DISPLAY=$(xrandr | grep primary | awk '{print $1}')


# let user choose output 
MONITOR=$(for i in $out;do echo -e "$i\n";done | grep . | rofi -dmenu -font 'hack 15' -p "output")


# now choose position or mode
echo "monitor: $MONITOR"


OPTIONS="above\nleft-of\nright-of\nbelow\nsame-as\noff"

MODE=$(echo -e $OPTIONS | rofi -dmenu -font 'hack 15')

echo "mode: $MODE"

set -xe

xrandr --output $PRIMARY_DISPLAY --auto --output $MONITOR --auto --$MODE $PRIMARY_DISPLAY




