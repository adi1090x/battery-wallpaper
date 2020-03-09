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
	darwin*) BATTERY="$(pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';'| tr -d \%,)" ;;
	linux*) BATTERY="$(acpi | awk -F ' ' 'END {print $4}' | tr -d \%,)" ;;
	*) BATTERY_PERCENT="?" ;;
esac

case "$OSTYPE" in
	darwin*) [[ $(pmset -g ps | head -1) =~ "AC Power" ]] && CHARGE=1 || CHARGE=0 ;;
	linux*) CHARGE=$(acpi | awk -F ' ' 'END {print $3}' | tr -d \,) ;;
	*) CHARGE=0 ;;
esac

## For XFCE
if [[ "$OSTYPE" == "linux"* ]]; then
    SCREEN="$(xrandr --listactivemonitors | awk -F ' ' 'END {print $1}' | tr -d \:)"
    MONITOR="$(xrandr --listactivemonitors | awk -F ' ' 'END {print $2}' | tr -d \*+)"
fi

case "$OSTYPE" in 
	darwin*) SETTER="wallpaper set" ;;
	linux*) if [ -n "$SWAYSOCK" ]; then SETTER="eval ogurictl output '*' --image"; 
	elif [[ "$DESKTOP_SESSION" =~ ^(MATE|Mate|mate)$ ]]; then SETTER="gsettings set org.mate.background picture-filename"; 
	elif [[ "$DESKTOP_SESSION" =~ ^(Xfce Session|xfce session|XFCE|xfce|Xubuntu|xubuntu)$ ]]; then SETTER="xfconf-query --channel xfce4-desktop --property /backdrop/screen$SCREEN/monitor$MONITOR/workspace0/last-image --set"; 
	elif [[ "$DESKTOP_SESSION" =~ ^(LXDE|Lxde|lxde)$ ]]; then SETTER="pcmanfm --set-wallpaper"; 
	elif [[ "$DESKTOP_SESSION" =~ ^(PANTHEON|Pantheon|pantheon|GNOME|Gnome|gnome|UBUNTU|Ubuntu|ubuntu|DEEPIN|Deepin|deepin)$ ]]; then SETTER="gsettings set org.gnome.desktop.background picture-uri"; 
	else SETTER="hsetroot -fill"; fi ;;
	*) if [ -n "$SWAYSOCK" ]; then SETTER="eval ogurictl output '*' --image"; 
	elif [[ "$DESKTOP_SESSION" =~ ^(MATE|Mate|mate)$ ]]; then SETTER="gsettings set org.mate.background picture-filename"; 
	elif [[ "$DESKTOP_SESSION" =~ ^(Xfce Session|xfce session|XFCE|xfce|Xubuntu|xubuntu)$ ]]; then SETTER="xfconf-query --channel xfce4-desktop --property /backdrop/screen$SCREEN/monitor$MONITOR/workspace0/last-image --set"; 
	elif [[ "$DESKTOP_SESSION" =~ ^(LXDE|Lxde|lxde)$ ]]; then SETTER="pcmanfm --set-wallpaper"; 
	elif [[ "$DESKTOP_SESSION" =~ ^(PANTHEON|Pantheon|pantheon|GNOME|Gnome|gnome|UBUNTU|Ubuntu|ubuntu|DEEPIN|Deepin|deepin)$ ]]; then SETTER="gsettings set org.gnome.desktop.background picture-uri"; 
	else SETTER="hsetroot -fill"; fi ;;
esac

## Style 1 - Cartoon #############################################
if  [[ $1 = "-cartoon" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/cartoon/battery_$1.png
}

function animate_wallpaper {
    for i in {1..4}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="5"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/25+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -cartoon
done

## Style 2 - colours #############################################
elif  [[ $1 = "-colours" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/colours/battery_$1.png
}

function animate_wallpaper {
    for i in {1..5}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="5"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -colours
done

## Style 3 - Cup Black #############################################
elif  [[ $1 = "-cup_black" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/cup_black/battery_$1.png
}

function animate_wallpaper {
    for i in {6..10}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="10"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -cup_black
done

## Style 4 - Cup Dark #############################################
elif  [[ $1 = "-cup_dark" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/cup_dark/battery_$1.png
}

function animate_wallpaper {
    for i in {6..10}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="10"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -cup_dark
done

## Style 5 - Egg #############################################
elif  [[ $1 = "-egg" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/egg/battery_$1.png
}

function animate_wallpaper {
    for i in {5..8}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="8"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/25+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -egg
done

## Style 6 - Faded #############################################
elif  [[ $1 = "-faded" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/faded/battery_$1.png
}

function animate_wallpaper {
    for i in {1..4}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="5"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/25+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -faded
done

## Style 7 - Industrial #############################################
elif  [[ $1 = "-industrial" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/industrial/battery_$1.png
}

function animate_wallpaper {
    for i in {6..10}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="10"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -industrial
done

## Style 8 - Mechanical #############################################
elif  [[ $1 = "-mechanical" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/mechanical/battery_$1.png
}

function animate_wallpaper {
    for i in {1..4}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="5"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/25+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -mechanical
done

## Style 9 - Paper #############################################
elif  [[ $1 = "-paper" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/paper/battery_$1.png
}

function animate_wallpaper {
    for i in {1..4}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="5"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/25+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -paper
done

## Style 10 - Slash #############################################
elif  [[ $1 = "-slash" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/slash/battery_$1.png
}

function animate_wallpaper {
    for i in {1..5}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="5"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -slash
done

## Style 11 - Bonsai #############################################
elif  [[ $1 = "-bonsai" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/bonsai/battery_$1.png
}

function animate_wallpaper {
    for i in {1,9}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="9"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/10))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -bonsai
done

## Style 12 - City #############################################
elif  [[ $1 = "-city" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/city/battery_$1.png
}

function animate_wallpaper {
    for i in {0,5}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="5"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -city
done

## Style 13 - City Alt #############################################
elif  [[ $1 = "-city_alt" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/city_alt/battery_$1.png
}

function animate_wallpaper {
    for i in {0,5}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="5"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -city_alt
done

## Style 14 - Pixel City #############################################
elif  [[ $1 = "-pixel_city" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/pixel_city/battery_$1.png
}

function animate_wallpaper {
    for i in {1,5}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="5"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -pixel_city
done

## Style 15 - space #############################################
elif  [[ $1 = "-space" ]]; then

function set_wallpaper {
    $SETTER $DIR/images/space/battery_$1.png
}

function animate_wallpaper {
    for i in {5,6}; do
        # cycle through charging images
        set_wallpaper $i; sleep 0.8
    done
}

function main {
	## Charging Animation
    if [[ $CHARGE = *"Charging"* ]] && [[ $BATTERY -lt "100" ]]; then
        animate_wallpaper
    ## Stop Animation When Fully Charged
    elif [[ $BATTERY -eq "100" ]]; then
        img="6"
        set_wallpaper $img; sleep 5
    ## Change According To Battery Percentage
    else
        num=$(($BATTERY/20+1))
        set_wallpaper $num; sleep 5
    fi
}

while true; do
	main && exec $DIR/battery_wall.sh -space
done

## Else Show This #############################################
else
echo "Battery Wallpaper V1.0
Developed By - Aditya Shakya (@adi1090x)

Available options:
-cartoon	-colours	-cup_black
-cup_dark	-egg		-faded
-industrial	-mechanical	-paper
-slash		-bonsai		-city
-city_alt	-pixel_city	-space
"
fi
