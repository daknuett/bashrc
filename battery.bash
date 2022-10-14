#!/bin/bash

# derived from 
# https://wiki.ubuntuusers.de/Bash/Prompt/
BATTERY_DIR=/sys/class/power_supply/BAT0/

if [ -e $BATTERY_DIR ]
then
    PERCENT=$(cat $BATTERY_DIR/capacity)
    if grep -q Charging $BATTERY_DIR/status
    then
        echo "౾  $PERCENT%"
    else
        echo "🔋 $PERCENT%"
    fi
else
    echo "౾"
fi
