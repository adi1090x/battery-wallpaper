#!/bin/bash

## Author : Aditya Shakya (adi1090x
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
	linux*) SETTER="hsetroot -fill" ;;
	*) SETTER="hsetroot -fill" ;;
esac


## Available styles
## cartoon, colours, cup_black, cup_dark
## egg, faded, industrial, mechanical,
## paper, slash
STYLE=


function set_wallpaper_charge {
    $SETTER $DIR/images/$STYLE/battery_$1.png
}

function set_wallpaper_bat {
    $SETTER $DIR/images/$STYLE/battery_$1.png
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
        $SETTER $DIR/images/$STYLE/charge.png; sleep 5

    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+1))
        set_wallpaper_bat $num; sleep 5
    fi
}


function usage {
echo -n "
    Battery Wallpaper V1.0
    Developed By - Aditya Shakya (@adi1090x)

    $ bwall <option>

    Available options:
    -cartoon	-colours	-cup_black
    -cup_dark	-egg		-faded
    -industrial	-mechanical	-paper
    -slash

"
}

function init {
    while true; do
        main && exec $DIR/battery_wall.sh -$STYLE
    done
}


function is_valid_style {
    available_styles=(-cartoon -colours -cup_black -cup_dark -egg -faded -industrial -mechanical -paper -slash)
    for i in "${available_styles[@]}"
    do
        if [ "$i" == "$1" ] ; then
            STYLE=$(echo $1 | cut -d- -f 2-)
        fi
    done
}


is_valid_style $1

if [[ $STYLE ]]; then
    init
else
    usage
fi
