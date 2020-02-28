#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

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
	linux*) if [ -n "$SWAYSOCK" ]; then SETTER="eval ogurictl output '*' --image"; else SETTER="hsetroot -fill"; fi ;;
	*) if [ -n "$SWAYSOCK" ]; then SETTER="eval ogurictl output '*' --image"; else SETTER="hsetroot -fill"; fi ;;
esac

## Style 1 - Cartoon #############################################
if  [[ $1 = "-cartoon" ]]; then
function set_wallpaper_charge {
    $SETTER $DIR/images/cartoon/battery_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/cartoon/battery_$1.png
}

function animate_wallpaper {
    for i in {1..4}; do
        # cycle through charging images
        set_wallpaper_charge $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE -eq "1" ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $CHARGE -eq "1" ]] && [[ $BATTERY -eq "100" ]]; then
        $SETTER $DIR/images/cartoon/charge.png; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/25+"1"))
        set_wallpaper_bat $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -cartoon
done

## Style 2 - colours #############################################
elif  [[ $1 = "-colours" ]]; then
function set_wallpaper_charge {
    $SETTER $DIR/images/colours/battery_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/colours/battery_$1.png
}

function animate_wallpaper {
    for i in {1..5}; do
        # cycle through charging images
        set_wallpaper_charge $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE -eq "1" ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $CHARGE -eq "1" ]] && [[ $BATTERY -eq "100" ]]; then
        num="5"
        set_wallpaper_charge $num; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+"1"))
        set_wallpaper_bat $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -colours
done

## Style 3 - Cup Black #############################################
elif  [[ $1 = "-cup_black" ]]; then
function set_wallpaper_charge {
    $SETTER $DIR/images/cup_black/charge_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/cup_black/battery_$1.png
}

function animate_wallpaper {
    for i in {1..5}; do
        # cycle through charging images
        set_wallpaper_charge $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE -eq "1" ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $CHARGE -eq "1" ]] && [[ $BATTERY -eq "100" ]]; then
        num="5"
        set_wallpaper_charge $num; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+"1"))
        set_wallpaper_bat $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -cup_black
done

## Style 4 - Cup Dark #############################################
elif  [[ $1 = "-cup_dark" ]]; then
function set_wallpaper_charge {
    $SETTER $DIR/images/cup_dark/charge_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/cup_dark/battery_$1.png
}

function animate_wallpaper {
    for i in {1..5}; do
        # cycle through charging images
        set_wallpaper_charge $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE -eq "1" ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $CHARGE -eq "1" ]] && [[ $BATTERY -eq "100" ]]; then
        num="5"
        set_wallpaper_charge $num; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+"1"))
        set_wallpaper_bat $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -cup_dark
done

## Style 5 - Egg #############################################
elif  [[ $1 = "-egg" ]]; then
function set_wallpaper_charge {
    $SETTER $DIR/images/egg/charge_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/egg/battery_$1.png
}

function animate_wallpaper {
    for i in {1..4}; do
        # cycle through charging images
        set_wallpaper_charge $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE -eq "1" ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $CHARGE -eq "1" ]] && [[ $BATTERY -eq "100" ]]; then
        num="4"
        set_wallpaper_charge $num; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/25+"1"))
        set_wallpaper_bat $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -egg
done

## Style 6 - Faded #############################################
elif  [[ $1 = "-faded" ]]; then
function set_wallpaper_charge {
    $SETTER $DIR/images/faded/battery_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/faded/battery_$1.png
}

function animate_wallpaper {
    for i in {1..4}; do
        # cycle through charging images
        set_wallpaper_charge $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE -eq "1" ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $CHARGE -eq "1" ]] && [[ $BATTERY -eq "100" ]]; then
        $SETTER $DIR/images/faded/charge.png; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/25+"1"))
        set_wallpaper_bat $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -faded
done

## Style 7 - Industrial #############################################
elif  [[ $1 = "-industrial" ]]; then
function set_wallpaper_charge {
    $SETTER $DIR/images/industrial/charge_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/industrial/battery_$1.png
}

function animate_wallpaper {
    for i in {1..5}; do
        # cycle through charging images
        set_wallpaper_charge $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE -eq "1" ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $CHARGE -eq "1" ]] && [[ $BATTERY -eq "100" ]]; then
        num="5"
        set_wallpaper_charge $num; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+"1"))
        set_wallpaper_bat $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -industrial
done

## Style 8 - Mechanical #############################################
elif  [[ $1 = "-mechanical" ]]; then
function set_wallpaper_charge {
    $SETTER $DIR/images/mechanical/battery_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/mechanical/battery_$1.png
}

function animate_wallpaper {
    for i in {1..4}; do
        # cycle through charging images
        set_wallpaper_charge $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE -eq "1" ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $CHARGE -eq "1" ]] && [[ $BATTERY -eq "100" ]]; then
        $SETTER $DIR/images/mechanical/charge.png; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/25+"1"))
        set_wallpaper_bat $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -mechanical
done

## Style 9 - Paper #############################################
elif  [[ $1 = "-paper" ]]; then
function set_wallpaper_charge {
    $SETTER $DIR/images/paper/battery_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/paper/battery_$1.png
}

function animate_wallpaper {
    for i in {1..4}; do
        # cycle through charging images
        set_wallpaper_charge $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE -eq "1" ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $CHARGE -eq "1" ]] && [[ $BATTERY -eq "100" ]]; then
        $SETTER $DIR/images/paper/charge.png; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/25+"1"))
        set_wallpaper_bat $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -paper
done

## Style 10 - Slash #############################################
elif  [[ $1 = "-slash" ]]; then
function set_wallpaper_charge {
    $SETTER $DIR/images/slash/battery_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/slash/battery_$1.png
}

function animate_wallpaper {
    for i in {1..5}; do
        # cycle through charging images
        set_wallpaper_charge $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE -eq "1" ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $CHARGE -eq "1" ]] && [[ $BATTERY -eq "100" ]]; then
        num="5"
        set_wallpaper_charge $num; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+"1"))
        set_wallpaper_bat $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -slash
done

## Else Show This #############################################
else
echo "Battery Wallpaper V1.0
Developed By - Aditya Shakya (@adi1090x)

Available options:
-cartoon	-colours	-cup_black
-cup_dark	-egg		-faded
-industrial	-mechanical	-paper
-slash
"
fi
