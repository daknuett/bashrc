#!/bin/bash

fixed_width () {
    local len=$(printf "%s" "$1" | wc -m)
    local place_holder="🤄"
    
    if [ $len -gt $2 ]
    then
        local cut_to=$(echo "$len $2 - 2 +p" | dc)
        local cutted_result=$(printf "%s" "$1" | cut -c$cut_to-)
        local value=$place_holder$cutted_result
    else
        local value=$1
    fi

    len=$(printf "%s" "$value" | wc -m)
    local n_pad=$(echo "$2 $len -p" | dc)

    if echo $3 | grep "r" 
    then
        echo "$(for i in $(seq $n_pad) ; do printf "%s" " " ; done)$value"
    else
        local pad_right=$(echo "$n_pad 2 /p" | dc)
        local test_pad=$(echo "$pad_right 2 *p" | dc)
        if [ $test_pad -lt $n_pad ]
        then 
            local pad_left=$(echo "$pad_right 1 +p" | dc)
        else
            local pad_left=$pad_right
        fi 
        echo "$(for i in $(seq $pad_left) ; do printf "%s" " " ; done)$value$(for i in $(seq $pad_right) ; do printf "%s" " " ; done)"

    fi

}

