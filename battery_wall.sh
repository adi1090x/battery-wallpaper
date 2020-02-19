#!/bin/bash

## Author : Aditya Shakya (adi1090x)

DIR="/usr/share/battery-wallpaper"

BAT="$(ls /sys/class/power_supply/ | grep -i BAT | head -n 1)"
AC="$(ls /sys/class/power_supply/ | grep -i AC | head -n 1)"

function get_battery {
    echo $(cat /sys/class/power_supply/$BAT/capacity)
}

function is_charging {
    echo $(cat /sys/class/power_supply/$AC/online)
}

function set_wallpaper {
    hsetroot -fill $DIR/images/charge_$1.png
}

function animate_wallpaper {
    for i in {1..5}; do
        # cycle through images
        set_wallpaper $i; sleep 0.8
    done
}

function main {

    BATTERY=get_battery
    CHARGING_STATUS=is_charging

    if [[ $CHARGING_STATUS == "1" ]]; then
        animate_wall
    else
        num=$(($BATTERY/20))
        set_wallpaper $num
    fi
}

while true; do
	main
done
