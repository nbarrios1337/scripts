#!/bin/bash

# Remember to 'chmod +x' this file

add-apt-repository universe restricted multiverse
sudo add-apt-repository ppa:daniruiz/flat-remix
apt update
apt full-upgrade -y
apt install -y \
powertop neofetch vlc git hub steam \
flat-remix-gtk flat-remix-gnome flat-remix \
ubuntu-restricted-extras \
flatpak gnome-software-plugin-flatpak \
gnome-tweak-tool gnome-tweaks gnome-shell-extensions

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

snap://spotify


#Final Steps
apt autoclean -y
apt autoremove -y

firefox \
https://www.google.com/chrome/browser/desktop/index.html \
https://support.system76.com/ \
https://extensions.gnome.org/ \
#https://go.microsoft.com/fwlink/?LinkID=760868 \

echo Remember to reboot!
