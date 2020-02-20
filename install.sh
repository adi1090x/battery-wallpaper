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
case "$OSTYPE" in
       darwin*) DES="/usr/local/share" ;;
       linux*) DES="/usr/share" ;; 
       *) DES="/usr/share" ;;
esac

case "$OSTYPE" in
       darwin*) BIN="/usr/local/bin" ;;
       linux*) BIN="/usr/bin" ;; 
       *) BIN="/usr/bin" ;;
esac

case "$OSTYPE" in
       darwin*) SUDO="" ;;
       linux*) SUDO="sudo" ;; 
       *) SUDO="sudo" ;;
esac

echo
echo -e $Y" [*] Installing... "$C
echo
# delete old dir if already exist
if [[ -d $DES/battery-wallpaper ]]; then
    $SUDO rm -rf $DES/battery-wallpaper    
fi
$SUDO mkdir -p $DES/battery-wallpaper && $SUDO cp -r $DIR/images $DES/battery-wallpaper && $SUDO cp -r $DIR/battery_wall.sh $DES/battery-wallpaper
$SUDO chmod +x $DES/battery-wallpaper/battery_wall.sh
# delete executable if already exist
if [[ -f $BIN/bwall ]]; then
    $SUDO rm $BIN/bwall    
fi
$SUDO ln -s $DES/battery-wallpaper/battery_wall.sh $BIN/bwall
echo
echo -e $Y" [*] Installed. Execute 'bwall' to Run."$C
echo
