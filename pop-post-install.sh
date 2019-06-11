#!/bin/bash

# Remember to 'chmod +x' this file

add-apt-repository universe 
add-apt-repository restricted 
add-apt-repository multiverse
add-apt-repository ppa:daniruiz/flat-remix
apt update
apt full-upgrade -y
apt install -y \
powertop neofetch vlc git hub steam nvme-cli\
flat-remix-gtk flat-remix-gnome flat-remix \
ubuntu-restricted-extras \
flatpak gnome-software-plugin-flatpak \
gnome-tweak-tool gnome-tweaks gnome-shell-extensions

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

snap install spotify


#Final Steps
apt autoclean -y
apt autoremove -y
apt install pop-desktop sessioninstaller

#TODO can't be root here
firefox \
https://www.google.com/chrome/browser/desktop/index.html \
https://support.system76.com/ \
https://extensions.gnome.org/ \
#https://go.microsoft.com/fwlink/?LinkID=760868 \

echo Remember to reboot!
