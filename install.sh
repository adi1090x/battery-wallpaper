#!/usr/bin/env bash

## Battery Wallpaper : Set desktop background according to battery percentage, with charging animation.

## ANSI Colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"

# Path
DIR=`pwd`
DES="/usr/share"

## Make dirs
mkdir_dw() {
	echo -e ${ORANGE}"[*] Installing Battery Wallpaper..."${WHITE}
	if [[ -d "$DES"/battery-wallpaper ]]; then
		# delete old directory
		sudo rm -rf "$DES"/battery-wallpaper
		# create new directory
		sudo mkdir -p "$DES"/battery-wallpaper
	else
		# create new directory
		sudo mkdir -p "$DES"/battery-wallpaper
	fi
}

## Copy files
copy_files() {
	# copy images and scripts
	sudo cp -r "$DIR"/images "$DES"/battery-wallpaper && sudo cp -r "$DIR"/bwall.sh "$DES"/battery-wallpaper
	# make script executable
	sudo chmod +x "$DES"/battery-wallpaper/bwall.sh
	# create link in bin directory
	if [[ -L /usr/bin/bwall ]]; then
		sudo rm /usr/bin/bwall
		sudo ln -s "$DES"/battery-wallpaper/bwall.sh /usr/bin/bwall
	else
		sudo ln -s "$DES"/battery-wallpaper/bwall.sh /usr/bin/bwall
	fi
	echo -e ${GREEN}"[*] Installed Successfully. Execute 'bwall' to Run."${WHITE}
}

## Install
mkdir_dw
copy_files
