# battery-wallpaper

<p align="left">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-blueviolet?style=flat-square">
  <img src="https://img.shields.io/github/license/adi1090x/battery-wallpaper?style=flat-square">
  <img src="https://img.shields.io/github/stars/adi1090x/battery-wallpaper?color=red&style=flat-square">
  <img src="https://img.shields.io/github/forks/adi1090x/battery-wallpaper?style=flat-square">
  <img src="https://img.shields.io/github/issues/adi1090x/battery-wallpaper?style=flat-square">
  <img src="https://img.shields.io/badge/Linux-Yes-yellow?style=flat-square&logo=linux">
  <img src="https://img.shields.io/badge/Mac-Yes-green?style=flat-square&logo=apple">
<a href="https://github.com/nadehi18/battery-wallpaper-windows" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/Windows-Yes-blue?style=flat-square&logo=windows"></a>  
</p>

Simple bash script to set an animated battery as desktop wallpaper. It's shows charging animation and changes according to battery percentage.

![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging.gif) <br />

### How to install
Follow the steps below -

+ Install *hsetroot* or *wallpaper* 
```
# On Archlinux
sudo pacman -Sy hsetroot

# On Ubuntu
sudo apt-get update && sudo apt-get install hsetroot

# On MacOS
brew install wallpaper
```
+ Clone this repository and...
```
cd $HOME
git clone https://github.com/adi1090x/battery-wallpaper.git
cd battery-wallpaper
chmod +x install.sh
./install.sh
```

### Features

+ Shows battery charging animation.
+ Stop animation when battery is fully charged.
+ When not charging, icon changes according to battery percentage.

|0-20%|20-40%|40-60%|60-80%|80-100%|
|--|--|--|--|--|
|![img](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/20.png)|![img](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/40.png)|![img](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/60.png)|![img](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/80.png)|![img](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/100.png)|

### FYI
+ Yeah, it's *very simple*, i know.
+ I'll add more battery icons/wallpapers later.
+ If you can improve it, you're welcome.
+ You can add ***bwall &*** to your wm autostart file to set it as wallpaper after login.
+ Have Fun!
