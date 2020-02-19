#!/bin/bash

## Author : Aditya Shakya (adi1090x)

# Colors
R='\033[1;31m'
B='\033[1;34m'
C='\033[0;36m'
G='\033[1;32m'
W='\033[1;37m'
Y='\033[1;33m'

# Path
DIR="$(pwd)"
DES="/usr/share"

echo
echo -e $Y" [*] Installing... "$C
echo
sudo mkdir -p $DES/battery-wallpaper && sudo cp -r $DIR/images $DES/battery-wallpaper && sudo cp -r $DIR/battery_wall.sh $DES/battery-wallpaper
sudo chmod +x $DES/battery-wallpaper/battery_wall.sh
sudo ln -s $DES/battery-wallpaper/battery_wall.sh /usr/bin/bwall
#cd .. && rm -rf battery-wallpaper
echo
echo -e $Y" [*] Installed. Execute 'bwall' to Run."$C
echo
