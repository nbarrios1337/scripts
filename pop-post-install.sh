#!/bin/bash

#Remember to 'chmod +x' this file

DIRECTORY=/var/log/scripts/
sudo mkdir -p ${DIRECTORY}
{
sudo add-apt-repository -y universe 
sudo add-apt-repository -y restricted 
sudo add-apt-repository -y multiverse

#Flat-Remix repo for flat-remix-gtk, flat-remix-gnome, and flat-remix packages
sudo add-apt-repository -y ppa:daniruiz/flat-remix

#Brave Browser repo setup (Copied from https://brave-browser.readthedocs.io/en/latest/installing-brave.html)
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-"${UBUNTU_CODENAME}".list

#Keybase setup and install (Copied from https://keybase.io/docs/the_app/install_linux#ubuntu-debian-and-friends)
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
# if you see an error about missing `libappindicator1` from the next
# command, you can ignore it, as the subsequent command corrects it
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase

#Bonsai.sh steup and install (Copied from https://gitlab.com/jallbrit/bonsai.sh/tree/master)
git clone https://gitlab.com/jallbrit/bonsai.sh ~/bin/bonsai.sh
chmod +x ~/bin/bonsai.sh/bonsai.sh
ln -s ~/bin/bonsai.sh/bonsai.sh ~/.local/bin/bonsai
echo "alias bonsai='~/bin/bonsai.sh/bonsai.sh'" >> ~/.bashrc
source ~/.bashrc


#Update all packages after all repos have been added
sudo apt update
sudo apt full-upgrade -y

sudo apt install -y \
snapd \
brave-keyring brave-browser \
flat-remix-gtk flat-remix-gnome flat-remix \
flatpak gnome-software-plugin-flatpak \
gnome-tweak-tool gnome-tweaks gnome-shell-extensions \
powertop neofetch vlc hub steam nvme-cli shellcheck 

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#For some reason, the snap package of Spotify is updated more often than the .deb package, so this is the exception
snap install spotify tldr

#For some reason, apt considers pop-desktop for removal. 
sudo apt install -y pop-desktop sessioninstaller

firefox \
https://downloads.slack-edge.com/linux_releases/slack-desktop-3.4.2-amd64.deb \
"https://discordapp.com/api/download?platform=linux&format=deb"  \
"https://www.jetbrains.com/toolbox/download/download-thanks.html?platform=linux" \
https://support.system76.com/  \
https://extensions.gnome.org/ \
https://code.visualstudio.com/docs/setup/linux \
https://www.google.com/chrome/ \
https://github.com/r-darwish/topgrade/releases/latest

#Ask for permission instead of the script default '-y'
sudo apt autoclean
sudo apt autoremove
} 2>&1 | sudo tee ${DIRECTORY}/"$(basename "$0")".log

echo Remember to reboot! Log of the processes stored at: ${DIRECTORY}/"$(basename "$0")".log
