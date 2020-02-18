#!/bin/bash

## Author : Aditya Shakya (adi1090x)

BAT="$(ls /sys/class/power_supply/ | grep -i BAT | head -n 1)"
AC="$(ls /sys/class/power_supply/ | grep -i AC | head -n 1)"

BATTERY="$(cat /sys/class/power_supply/$BAT/capacity)"
CHARGE="$(cat /sys/class/power_supply/$AC/online)"

function battery {
	if [[ $CHARGE == 1 ]]; then
       hsetroot -fill images/charge_1.png ; sleep 0.8
       hsetroot -fill images/charge_2.png ; sleep 0.8
       hsetroot -fill images/charge_3.png ; sleep 0.8
       hsetroot -fill images/charge_4.png ; sleep 0.8
       hsetroot -fill images/charge_5.png ; sleep 0.8
          
	elif [[ $BATTERY -ge 5 ]] && [[ $BATTERY -le 20 ]]; then
       hsetroot -fill images/battery_1.png ; sleep 5
	elif [[ $BATTERY -ge 20 ]] && [[ $BATTERY -le 40 ]]; then
       hsetroot -fill images/battery_2.png ; sleep 5
	elif [[ $BATTERY -ge 40 ]] && [[ $BATTERY -le 60 ]]; then
       hsetroot -fill images/battery_3.png ; sleep 5
	elif [[ $BATTERY -ge 60 ]] && [[ $BATTERY -le 80 ]]; then
       hsetroot -fill images/battery_4.png ; sleep 5
	elif [[ $BATTERY -ge 80 ]] && [[ $BATTERY -le 100 ]]; then
       hsetroot -fill images/battery_5.png ; sleep 5
    fi
}

while true;do
	battery && exec $(pwd)/test.sh
done
