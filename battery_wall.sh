#!/bin/bash

## Author : Aditya Shakya (adi1090x)

DIR="/usr/share/battery-wallpaper"

BAT="$(ls /sys/class/power_supply/ | grep -i BAT | head -n 1)"
AC="$(ls /sys/class/power_supply/ | grep -i AC | head -n 1)"

BATTERY="$(cat /sys/class/power_supply/$BAT/capacity)"
CHARGE="$(cat /sys/class/power_supply/$AC/online)"

function battery {
	if [[ $CHARGE == 1 ]] && [[ $BATTERY -lt 100 ]]; then
       hsetroot -fill $DIR/images/charge_1.png ; sleep 0.8
       hsetroot -fill $DIR/images/charge_2.png ; sleep 0.8
       hsetroot -fill $DIR/images/charge_3.png ; sleep 0.8
       hsetroot -fill $DIR/images/charge_4.png ; sleep 0.8
       hsetroot -fill $DIR/images/charge_5.png ; sleep 0.8
	elif [[ $CHARGE == 1 ]] && [[ $BATTERY -eq 100 ]]; then
       hsetroot -fill $DIR/images/charge_5.png ; sleep 5

	elif [[ $BATTERY -ge 5 ]] && [[ $BATTERY -le 20 ]]; then
       hsetroot -fill $DIR/images/battery_1.png ; sleep 5
	elif [[ $BATTERY -ge 20 ]] && [[ $BATTERY -le 40 ]]; then
       hsetroot -fill $DIR/images/battery_2.png ; sleep 5
	elif [[ $BATTERY -ge 40 ]] && [[ $BATTERY -le 60 ]]; then
       hsetroot -fill $DIR/images/battery_3.png ; sleep 5
	elif [[ $BATTERY -ge 60 ]] && [[ $BATTERY -le 80 ]]; then
       hsetroot -fill $DIR/images/battery_4.png ; sleep 5
	elif [[ $BATTERY -ge 80 ]] && [[ $BATTERY -le 100 ]]; then
       hsetroot -fill $DIR/images/battery_5.png ; sleep 5
    fi
}

while true;do
	battery && exec $DIR/battery_wall.sh
done
