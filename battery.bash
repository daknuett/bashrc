#!/bin/bash

# derived from 
# https://wiki.ubuntuusers.de/Bash/Prompt/
BATTERY_DIR=/sys/class/power_supply/BAT0/
source ~/.bash/fixedwith.sh

if [ -e $BATTERY_DIR ]
then
    PERCENT=$(cat $BATTERY_DIR/capacity)
    if grep -q "Charging\|Full" $BATTERY_DIR/status 
    then
        echo "$(fixed_width "↯  $PERCENT%" $1)"
    else
        echo "$(fixed_width "🔋 $PERCENT%" $(echo "$1 1 -p" | dc))"
    fi
else
    echo "$(fixed_width "↯" $1)"
fi
