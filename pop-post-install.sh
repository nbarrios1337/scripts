#!/bin/bash

#Remember to 'chmod +x' this file
#the backtick comments are expensive, TODO find better commenting mechanism that doesn't break multiline commands with '\'

add-apt-repository universe 
add-apt-repository restricted 
add-apt-repository multiverse

#Flat-Remix repo for flat-remix-gtk, flat-remix-gnome, and flat-remix packages
add-apt-repository ppa:daniruiz/flat-remix

#Brave Browser repo setup (Copied from https://brave-browser.readthedocs.io/en/latest/installing-brave.html)
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | tee /etc/apt/sources.list.d/brave-browser-release-"${UBUNTU_CODENAME}".list

#Keybase setup and install (Copied from https://keybase.io/docs/the_app/install_linux#ubuntu-debian-and-friends)
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
# if you see an error about missing `libappindicator1` from the next
# command, you can ignore it, as the subsequent command corrects it
dpkg -i keybase_amd64.deb
apt-get install -f
sudo -u "$USER" run_keybase

#Bonsai.sh steup and install (Copied from https://gitlab.com/jallbrit/bonsai.sh/tree/master)
git clone https://gitlab.com/jallbrit/bonsai.sh ~/bin/bonsai.sh
chmod +x ~/bin/bonsai.sh/bonsai.sh
ln -s ~/bin/bonsai.sh/bonsai.sh ~/.local/bin/bonsai

#Update all packages after all repos have been added
apt update
apt full-upgrade -y

apt install -y \
snapd `#Just in Case` \
brave-keyring brave-browser `#Brave Browser` \
flat-remix-gtk flat-remix-gnome flat-remix `#Flat-Remix theme` \
flatpak gnome-software-plugin-flatpak `#Flatpak` \
gnome-tweak-tool gnome-tweaks gnome-shell-extensions `#GNOME Tweaks` \
powertop neofetch vlc hub steam nvme-cli shellcheck `#Add misc. packages here`

flatpak remote-add -y --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#For some reason, the snap package of Spotify is updated more often than the .deb package, so this is the exception
snap install spotify

#For some reason, apt considers pop-desktop for removal. 
apt install -y pop-desktop sessioninstaller

sudo -u "$USER" firefox \
https://slack.com/downloads/instructions/ubuntu `#Downloads Slack` \
"https://discordapp.com/api/download?platform=linux&format=deb" `#Downloads Discord` \
"https://www.jetbrains.com/toolbox/download/download-thanks.html?platform=linux" `#Downloads JetBrains Toolbox App` \
https://support.system76.com/ `#Opens Pop!_OS Support Docs` \
https://extensions.gnome.org/ `#Opens GNOME Extensions Page` \
https://code.visualstudio.com/docs/setup/linux `#Opens VSCode Setup` \
https://www.google.com/chrome/ `#Opens Google Chrome Download Page`

#Ask for permission instead of the script default '-y'
apt autoclean
apt autoremove


echo Remember to reboot!
