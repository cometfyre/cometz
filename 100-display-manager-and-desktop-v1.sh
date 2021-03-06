#!/bin/bash
set -e
##################################################################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
echo "#################################################"
echo "If it feels like the downloads are too slow"
echo "Stop the installation with CTRL + C"
echo "and run the alias - mirror in the terminal"
echo "#################################################"

sudo pacman -Syyu
#bug with deepin-anything - see github
sudo pacman -S linux-headers --noconfirm --needed

sudo pacman -S lightdm arcolinux-lightdm-gtk-greeter arcolinux-lightdm-gtk-greeter-settings --noconfirm --needed
sudo pacman -S deepin deepin-extra --noconfirm --needed
sudo systemctl enable lightdm.service -f
sudo systemctl set-default graphical.target

echo "Changing /etc/lightdm/lightdm.conf to deepin"

sudo sed -i 's/'#user-session=default'/'user-session=deepin'/g' /etc/lightdm/lightdm.conf
sudo sed -i 's/'#greeter-session=example-gtk-gnome'/'greeter-session=lightdm-gtk-greeter'/g' /etc/lightdm/lightdm.conf

#this is here if one decides to reboot after this script then we have a nice wallpaper
sudo pacman -S arcolinux-wallpapers-git --noconfirm --needed
#Remove anything you do not like from the installed applications

#sudo pacman -R ...
