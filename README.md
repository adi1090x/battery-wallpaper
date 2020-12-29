<!-- Battery Wallpaper -->

<p align="center">
  <img src="https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/logo.png">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=for-the-badge">
  <img src="https://img.shields.io/github/license/adi1090x/battery-wallpaper?style=for-the-badge">
  <img src="https://img.shields.io/github/stars/adi1090x/battery-wallpaper?style=for-the-badge">
  <img src="https://img.shields.io/github/issues/adi1090x/battery-wallpaper?color=violet&style=for-the-badge">
  <img src="https://img.shields.io/github/forks/adi1090x/battery-wallpaper?color=teal&style=for-the-badge">
</p>

<p align="center">
  <a href="https://www.buymeacoffee.com/adi1090x" target="_blank"><img alt="undefined" width="48px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/1.png"></a>
  <a href="https://ko-fi.com/adi1090x" target="_blank"><img alt="undefined" width="48px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/2.png"></a>
  <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=U3VK2SSVQWAPN" target="_blank"><img alt="undefined" width="48px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/3.png"></a>
  <a href="https://www.patreon.com/adi1090x" target="_blank"><img alt="undefined" width="48px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/4.png"></a>
</p>

<p align="center">A simple <code>bash</code> script to set an <b>animated battery</b> as desktop wallpaper. It shows charging animation and changes according to <b>battery percentage</b>.</p>

![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/leaves.gif) <br />

### Overview

+ 21 different types of battery wallpapers/icons.
+ Shows battery charging animation.
+ Stop animation when the battery is fully charged.
+ When not charging, the wallpaper/icon changes according to battery percentage.
+ Users can add their own icons/styles/wallpapers.
+ Tested on :
  - **`Window Managers`** : `Openbox`, `i3wm`, `bspwm`, `awesomewm`, `Fluxbox`, `Fvwm`, `Swaywm`
  - **`Desktop Environments`** : `KDE`, `Pantheon`, `Gnome`, `Deepin`, `Cinnamon`, `XFCE`, `LXDE`, `MATE`

### Dependencies

Install Following programs on your system before using `bwall` -

- **`acpi`** : To get battery and charging data
- **`feh`** : To set wallpapers on WMs
- **`xrandr`** : Only if you're using XFCE desktop

Install `acpi`, `feh` and `xrandr` -
```bash
# On Archlinux
$ sudo pacman -Sy acpi feh xorg-xrandr

# On Ubuntu or Debian
$ sudo apt-get install acpi feh x11-xserver-utils
```

> For swaywm support users must install [oguri](https://github.com/vilhalmer/oguri). The `oguri` daemon must be started for the script to work. `Oguri` can be installed on Arch linux via [AUR](https://aur.archlinux.org/packages/oguri-git/).

### Installation

Follow the step below to install `bwall` on your system -
> You can run `test.sh` to test it before installing it on your system.

+ Clone this repository -
```
$ git clone https://github.com/adi1090x/battery-wallpaper.git
```

+ Change to cloned directory and run `install.sh` -
```
$ cd battery-wallpaper
$ chmod +x install.sh
$ ./install.sh
```

### Run the program

+ Open the terminal and execute `bwall` -
```
$ bwall

┏┓ ┏━┓╺┳╸╺┳╸┏━╸┏━┓╻ ╻   ╻ ╻┏━┓╻  ╻  ┏━┓┏━┓┏━┓┏━╸┏━┓
┣┻┓┣━┫ ┃  ┃ ┣╸ ┣┳┛┗┳┛   ┃╻┃┣━┫┃  ┃  ┣━┛┣━┫┣━┛┣╸ ┣┳┛
┗━┛╹ ╹ ╹  ╹ ┗━╸╹┗╸ ╹    ┗┻┛╹ ╹┗━╸┗━╸╹  ╹ ╹╹  ┗━╸╹┗╸

Bwall V2.0   : Set desktop wallpaper according to battery percentage.
Developed By : Aditya Shakya (@adi1090x)

Usage : bwall.sh [-h] [-d] delay [-s style]

Options:
   -h          Show this help message
   -d  num     Set charging animation delay (default 0.8s)
   -s  style   Name of the wallpaper style to apply
   
Available styles:  bar  bonsai  cartoon  charge  city  city_alt  colours  cup_black  cup_dark  egg
faded  frame  industrial  leaves  mechanical  panel  paper  pixel_city  slash  space  sweet  

Examples: 
bwall.sh -s bonsai      Set wallpaper from 'bonsai' style
bwall.sh -d 1 -s bar    Set wallpaper from 'bar' style with 1sec delay
```

+ Select the style you like and run -
```
$ bwall -s bonsai
[*] Using style : bonsai
```

### Previews

<details><summary>Click To View</summary>

`Bonsai`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/bonsai.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/bonsai.png)|

`Bar`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/bar.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/bar.png)|

`Cartoon`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/cartoon.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/cartoon.png)|

`Charge`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/charge.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/charge.png)|

`Colours`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/colours.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/colours.png)|

`Cup Black`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/cup_black.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/cup_black.png)|

`Cup Dark`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/cup_dark.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/cup_dark.png)|

`Egg`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/egg.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/egg.png)|

`Faded`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/faded.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/faded.png)|

`Frame`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/frame.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/frame.png)|

`Industrial`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/industrial.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/industrial.png)|

`Leaves`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/leaves.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/leaves.png)|

`Mechanical`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/mechanical.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/mechanical.png)|

`Panel`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/panel.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/panel.png)|

`Paper`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/paper.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/paper.png)|

`Slash`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/slash.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/slash.png)|

`Sweet`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/sweet.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/sweet.png)|

`Space`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/space.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/space.png)|

`Pixel City`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/pixel_city.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/pixel_city.png)|

`City`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/city.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/city.png)|

`City Alt`
|Charging|Full|
|-|-|
|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging/city_alt.gif)|![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/full/city_alt.png)|

</details>

### Common Issues

1. **Wallpaper not changing** : If your wallpaper is not changing, then open an issue and show me the output of `echo $DESKTOP_SESSION`.

2. **Not working on XFCE** : If this script is not working on xfce, then open the terminal and run `xfconf-query -c xfce4-desktop -m` and change the wallpaper (any) via *xfce4-settings-manager*. <br />
In the terminal, *xfconf-query* will print lines starting with `set:`, which show which properties have been changed, check `screen` & `monitor` values and modify the script accordingly.
```bash
110   ## For XFCE
111   if [[ "$OSTYPE" == "linux"* ]]; then
112      SCREEN="0"
113      MONITOR="1"
114   fi

```

3. **Autostart** : If you want to autostart the script with desktop, you can add it to your WM autostart file & if it doesn't work for you, you can create a `desktop file` in `$HOME/.config/autostart` dir.
```bash
$ cd $HOME/.config/autostart && touch bwall.desktop

# Add this to bwall.desktop file

[Desktop Entry]
Name=Battery Wallpaper
Comment=Set desktop background according to battery percentage, with charging animation.
Exec=/usr/bin/bwall -s leaves &
Type=Application
Icon=wallpaper
Categories=Accessories;
```

### Quick FYI
+ In KDE, `bwall` changes the wallpaper in all the Activities.
+ You can add ***bwall -s style &*** to your wm autostart file to set it as wallpaper after login.
+ Have Fun!
