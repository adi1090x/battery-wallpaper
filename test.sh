#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

## Battery Wallpaper : Set desktop background according to battery percentage, with charging animation.

## ANSI Colors (FG & BG)
RED="$(printf '\033[31m')"        GREEN="$(printf '\033[32m')"
ORANGE="$(printf '\033[33m')"     BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"    CYAN="$(printf '\033[36m')"
WHITE="$(printf '\033[37m')"      BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"      GREENBG="$(printf '\033[42m')"
ORANGEBG="$(printf '\033[43m')"   BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"
WHITEBG="$(printf '\033[47m')"    BLACKBG="$(printf '\033[40m')"

## Stuff
DIR="`pwd`/images"
DELAY=0.8
BATTERY="$(acpi | awk -F ' ' 'END {print $4}' | tr -d \%,)"
CHARGE="$(acpi | awk -F ' ' 'END {print $3}' | tr -d \,)"

## Wordsplit in ZSH
set -o shwordsplit 2>/dev/null

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

## Script Termination
exit_on_signal_SIGINT() {
    { printf "${RED}\n\n%s\n\n" "[!] Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "${RED}\n\n%s\n\n" "[!] Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Prerequisite
Prerequisite() { 
    dependencies=(acpi feh xrandr)
    for dependency in "${dependencies[@]}"; do
        type -p "$dependency" &>/dev/null || {
            echo -e ${RED}"[!] ERROR: Could not find ${GREEN}'${dependency}'${RED}, is it installed?" >&2
            { reset_color; exit 1; }
        }
    done
}

## Usage
usage() {
	clear
    cat <<- EOF
		${RED}┏┓ ┏━┓╺┳╸╺┳╸┏━╸┏━┓╻ ╻   ${GREEN}╻ ╻┏━┓╻  ╻  ┏━┓┏━┓┏━┓┏━╸┏━┓
		${RED}┣┻┓┣━┫ ┃  ┃ ┣╸ ┣┳┛┗┳┛   ${GREEN}┃╻┃┣━┫┃  ┃  ┣━┛┣━┫┣━┛┣╸ ┣┳┛
		${RED}┗━┛╹ ╹ ╹  ╹ ┗━╸╹┗╸ ╹    ${GREEN}┗┻┛╹ ╹┗━╸┗━╸╹  ╹ ╹╹  ┗━╸╹┗╸${WHITE}
		
		Bwall V3.0   : Set desktop wallpaper according to battery percentage.
		Developed By : Aditya Shakya (@adi1090x)
			
		Usage : `basename $0` [-h] [-d] delay [-s style]

		Options:
		   -h          Show this help message
		   -d  num     Set charging animation delay (default 0.8s)
		   -s  style   Name of the wallpaper style to apply
		   
	EOF

	styles=(`ls "$DIR"`)
	printf ${GREEN}"Available styles:  "
	printf -- ${ORANGE}'%s  ' "${styles[@]}"
	printf -- '\n\n'${WHITE}

    cat <<- EOF
		Examples: 
		`basename $0` -s bonsai      Set wallpaper from 'bonsai' style
		`basename $0` -d 1 -s bar    Set wallpaper from 'bar' style with 1sec delay
		
	EOF
}

## Set wallpaper in kde
set_kde() {
	qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
		var allDesktops = desktops();
		print (allDesktops);
		for (i=0;i<allDesktops.length;i++) {
			d = allDesktops[i];
			d.wallpaperPlugin = 'org.kde.image';
			d.currentConfigGroup = Array('Wallpaper',
										'org.kde.image',
										'General');
			d.writeConfig('Image', 'file://"$1"')
		}"
}

## Set wallpaper in cinnamon
set_cinnamon() {
	 gsettings set org.cinnamon.desktop.background picture-uri "file:///$1"
}

## Set wallpaper in GNOME
set_gnome() {
	gsettings set org.gnome.desktop.background picture-uri "file:///$1"
	gsettings set org.gnome.desktop.screensaver picture-uri "file:///$1"
}

## Choose wallpaper setter
case "$OSTYPE" in
	linux*)
			if [[ "$XDG_SESSION_TYPE" == 'x11' ]]; then
				if [[ "$DESKTOP_SESSION" =~ ^(MATE|Mate|mate)$ ]]; then
					SETTER="gsettings set org.mate.background picture-filename"
				elif [[ "$DESKTOP_SESSION" =~ ^(Xfce Session|xfce session|XFCE|xfce|Xubuntu|xubuntu)$ ]]; then
					SCREEN="$(xrandr --listactivemonitors | awk -F ' ' 'END {print $1}' | tr -d \:)"
					MONITOR="$(xrandr --listactivemonitors | awk -F ' ' 'END {print $2}' | tr -d \*+)"
					SETTER="xfconf-query --channel xfce4-desktop --property /backdrop/screen$SCREEN/monitor$MONITOR/workspace0/last-image --set"
				elif [[ "$DESKTOP_SESSION" =~ ^(LXDE|Lxde|lxde)$ ]]; then
					SETTER="pcmanfm --set-wallpaper"
				elif [[ "$DESKTOP_SESSION" =~ ^(cinnamon|Cinnamon)$ ]]; then
					SETTER=set_cinnamon
				elif [[ "$DESKTOP_SESSION" =~ ^(/usr/share/xsessions/plasma|/usr/share/xsessions/plasmax11|NEON|Neon|neon|PLASMA|Plasma|plasma|KDE|Kde|kde)$ ]]; then
					SETTER=set_kde
				elif [[ "$DESKTOP_SESSION" =~ ^(PANTHEON|Pantheon|pantheon|GNOME|Gnome|gnome|Gnome-xorg|gnome-xorg|gnome-classic|UBUNTU|Ubuntu|ubuntu|DEEPIN|Deepin|deepin|POP|Pop|pop|ZORIN|Zorin|zorin|budgie-desktop)$ ]]; then
					SETTER=set_gnome
				else 
					SETTER="feh --bg-fill"
				fi
			elif [[ "$XDG_SESSION_TYPE" == 'wayland' ]]; then
				SETTER="eval ogurictl output '*' --image"
			fi
			;;
esac

## Display Info
display_info() {
	if [[ "$XDG_SESSION_TYPE" == 'x11' ]]; then
		echo -e ${ORANGE}"[*] Setting wallpaper in ${GREEN}$XDG_SESSION_TYPE ($DESKTOP_SESSION)${ORANGE} session, using : ${MAGENTA}$SETTER"
	elif [[ "$XDG_SESSION_TYPE" == 'wayland' ]]; then
		if [[ ! `pidof oguri` ]]; then
			echo -e ${RED}"[*] 'oguri' daemon is not running. You must start the daemon first.\n[!] Kill 'swaybg' in sway session if the wallpaper is not getting applied."
			exit 1
		else
			echo -e ${ORANGE}"[*] Setting wallpaper in ${GREEN}$XDG_SESSION_TYPE ($XDG_SESSION_DESKTOP)${ORANGE} session, using : ${MAGENTA}$SETTER"
		fi
	fi
}

## Wallpaper Setter
set_wallpaper() {
	cfile="$HOME/.cache/bwall_current"
	image="$DIR/$STYLE/$1"

	# get image format
	if [[ -f "${image}.png" ]]; then
		FORMAT="png"
	elif [[ -f "${image}.jpg" ]]; then
		FORMAT="jpg"
	else
		echo -e ${RED}"[!] Invalid image file, Exiting..."
		{ reset_color; exit 1; }
	fi

	# set wallpaper with setter
	if [[ -n "$FORMAT" ]]; then
		$SETTER "$image.$FORMAT"
	fi

	# make/update dwall cache file
	if [[ ! -f "$cfile" ]]; then
		touch "$cfile"
		echo "$image.$FORMAT" > "$cfile"
	else
		echo "$image.$FORMAT" > "$cfile"	
	fi
}

## Check valid style
check_style() {
	styles=(`ls "$DIR"`)
	display_info
	for i in "${styles[@]}"; do
		if [[ "$i" == "$1" ]]; then
			echo -e ${BLUE}"[*] Using style : ${MAGENTA}$1"
			VALID='YES'
			{ reset_color; break; }
		else
			continue
		fi
	done

	if [[ -z "$VALID" ]]; then
		echo -e ${RED}"[!] Invalid style name : ${GREEN}$1${RED}, exiting..."
		{ reset_color; exit 1; }
	fi
}

## Animate wallpaper on charging
animate_wallpaper() {
	if [[ "$STYLE" == "bonsai" ]]; then
		for i in {1,9}; do
			set_wallpaper $i; sleep "$DELAY"
		done
	elif [[ "$STYLE" == "cartoon" || "$STYLE" == "faded" || "$STYLE" == "mechanical" || "$STYLE" == "paper" ]]; then
		for i in {1,2,5,8}; do
			set_wallpaper $i; sleep "$DELAY"
		done
	elif [[ "$STYLE" == "city" || "$STYLE" == "city_alt" || "$STYLE" == "space" ]]; then
		for i in {0,1,2,4,6,9}; do
			set_wallpaper $i; sleep "$DELAY"
		done
	elif [[ "$STYLE" == "pixel_city" || "$STYLE" == "slash" || "$STYLE" == "colours" ]]; then
		for i in {1,2,4,6,8}; do
			set_wallpaper $i; sleep "$DELAY"
		done
	elif [[ "$STYLE" == "cup_black" || "$STYLE" == "cup_dark" || "$STYLE" == "industrial" || "$STYLE" == "bar" || "$STYLE" == "charge" || "$STYLE" == "frame" || "$STYLE" == "sweet" ]]; then
		for i in {11,12,13,14,15}; do
			set_wallpaper $i; sleep "$DELAY"
		done
	elif [[ "$STYLE" == "egg" || "$STYLE" == "leaves" || "$STYLE" == "panel" ]]; then
		for i in {11,12,13,14}; do
			set_wallpaper $i; sleep "$DELAY"
		done
	# Plasma desktop crash during animation, so setting a single image as wallpaper during charging.
	elif [[ "$DESKTOP_SESSION" =~ ^(/usr/share/xsessions/plasma|/usr/share/xsessions/plasmax11|NEON|Neon|neon|PLASMA|Plasma|plasma|KDE|Kde|kde)$ ]]; then 
        img="full"
        set_wallpaper $img; sleep 5
    fi
}

## Main
main() {
	while true; do
		# charging animation
		if [[ ($CHARGE = *"Charging"*) && ($BATTERY -lt "100") ]]; then
			animate_wallpaper
		# stop animation when fully charged
		elif [[ $CHARGE = *"Full"* ]]; then
			img="full"
			set_wallpaper $img; sleep 2
		# change according to battery percentage
		else
			num=$(($BATTERY/10))
			set_wallpaper $num; sleep 2
		fi
		# relaunch script as it doesn't switch b/w charging and discharging state
		exec ./`basename $0` -d "$DELAY" -s "$STYLE"
    done
}

## Get Options
while getopts ":s:d:h" opt; do
	case ${opt} in
		s)
			STYLE=$OPTARG
			;;
		d)
			DELAY=$OPTARG
			;;
		h)
			{ usage; reset_color; exit 0; }
			;;
		\?)
			echo -e ${RED}"[!] Unknown option, run ${GREEN}`basename $0` -h"
			{ reset_color; exit 1; }
			;;
		:)
			echo -e ${RED}"[!] Invalid:$GREEN -${OPTARG}$RED requires an argument."
			{ reset_color; exit 1; }
			;;
	esac
done

## Run
Prerequisite
if [[ "$STYLE" ]]; then
	check_style "$STYLE"
    main
else
	{ usage; reset_color; exit 1; }
fi
