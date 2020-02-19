#!/bin/bash

## Author : Aditya Shakya (adi1090x)

case "$OSTYPE" in
	darwin*) DIR="/usr/local/share/battery-wallpaper" ;;
	linux*) DIR="/usr/share/battery-wallpaper" ;;
	*) DIR="/usr/share/battery-wallpaper" ;;
esac


case "$OSTYPE" in
	darwin*) BATTERY="$(pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';')" ;;
	linux*) BAT="$(ls /sys/class/power_supply/ | grep -i BAT | head -n 1)"; BATTERY="$(cat /sys/class/power_supply/$BAT/capacity)" ;;
	*) BATTERY_PERCENT="?" ;;
esac

case "$OSTYPE" in
	darwin*) [[ $(pmset -g ps | head -1) =~ "AC Power" ]] && CHARGE=1 || CHARGE=0 ;;
	linux*) AC="$(ls /sys/class/power_supply/ | grep -i AC | head -n 1)"; CHARGE=$(cat /sys/class/power_supply/$AC/online) ;;
	*) CHARGE=0 ;;
esac

case "$OSTYPE" in 
	darwin*) SETTER="wallpaper set" ;;
	linux*) SETTER="hsetroot -fill" ;;
	*) SETTER="hsetroot -fill" ;;
esac


function battery {
	if [[ $CHARGE == 1 ]]; then
	$SETTER $DIR/images/charge_1.png ; sleep 0.8
	$SETTER $DIR/images/charge_2.png ; sleep 0.8
	$SETTER $DIR/images/charge_3.png ; sleep 0.8
	$SETTER $DIR/images/charge_4.png ; sleep 0.8
	$SETTER $DIR/images/charge_5.png ; sleep 0.8
	   
	elif [[ "$BATTERY" -ge 5 ]] && [[ "$BATTERY" -le 20 ]]; then
	$SETTER $DIR/images/battery_1.png ; sleep 5
	elif [[ "$BATTERY" -ge 20 ]] && [[ "$BATTERY" -le 40 ]]; then
	$SETTER $DIR/images/battery_2.png ; sleep 5
	elif [[ "$BATTERY" -ge 40 ]] && [[ "$BATTERY" -le 60 ]]; then
	$SETTER $DIR/images/battery_3.png ; sleep 5
	elif [[ "$BATTERY" -ge 60 ]] && [[ "$BATTERY" -le 80 ]]; then
	$SETTER $DIR/images/battery_4.png ; sleep 5
	elif [[ "$BATTERY" -ge 80 ]] && [[ "$BATTERY" -le 100 ]]; then
	$SETTER $DIR/images/battery_5.png ; sleep 5
	fi
}

while true;do
	battery && exec $DIR/battery_wall.sh
done
