# battery-wallpaper
Simple bash script to set an animated battery as desktop wallpaper.

![gif](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/charging.gif) <br />

### How to install
Follow the steps below -

+ Install *hsetroot*
```
# On Archlinux
sudo pacman -Sy hsetroot

# On Ubunut
sudo apt-get update && sudo apt-get install hsetroot
```
+ Clone this repository and...
```
cd $HOME
git clone https://github.com/adi1090x/battery-wallpaper.git
cd battery-wallpaper
chmod +x install.sh
./install.sh
```

### Previews

|0-20%|20-40%|40-60%|60-80%|80-100%|
|--|--|--|--|--|
|![img](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/20.png)|![img](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/40.png)|![img](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/60.png)|![img](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/80.png)|![img](https://raw.githubusercontent.com/adi1090x/battery-wallpaper/master/preview/100.png)|

### FYI
+ Yeah, it's very simple.
+ You can add *bwall &* to your wm autostart file to set it as wallpaper after login.
+ Have Fun!
