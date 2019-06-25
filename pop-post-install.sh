#!/bin/bash

#Remember to 'chmod +x' this file

DIRECTORY=/var/log/scripts/
CANDY=./candy.sh

sugar_free=0

while [ -n "$1" ]; do
    case $1 in
        -s | --sugar-free )
            sugar_free=1
            ;;
        * )
            echo Invalid argument: "$1" >&2
            exit 1
    esac
    shift
done

run_candy() {
    if [[ -e "${CANDY}" ]]; then
        echo "${CANDY}" does not exist. >&2
        return
    elif [[ -x "${CANDY}" ]]; then
        echo "${CANDY}" is not executable. >&2
        return
    fi
    ${CANDY}
}


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

    #TODO move bonsai setup to ${CANDY}
    #Bonsai.sh steup and install (Copied from https://gitlab.com/jallbrit/bonsai.sh/tree/master)
    git clone https://gitlab.com/jallbrit/bonsai.sh ~/bin/bonsai.sh
    chmod +x ~/bin/bonsai.sh/bonsai.sh
    ln -s ~/bin/bonsai.sh/bonsai.sh ~/.local/bin/bonsai
    echo "alias bonsai='~/bin/bonsai.sh/bonsai.sh'" >> ~/.bashrc
    source ~/.bashrc


    #Update all packages after all repos have been added
    sudo apt-get update
    sudo apt-get dist-upgrade -y

    sudo apt-get install -y \
    snapd \
    brave-keyring brave-browser \
    flat-remix-gtk flat-remix-gnome flat-remix \
    flatpak gnome-software-plugin-flatpak \
    gnome-tweak-tool gnome-tweaks gnome-shell-extensions \
    powertop neofetch vlc hub steam nvme-cli shellcheck needsrestart

    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    #The snap package of Spotify is updated more often than the .deb package.
    snap install spotify tldr

    #apt considers pop-desktop for removal, manually install. 
    sudo apt-get install -y pop-desktop sessioninstaller

    firefox \
    "https://downloads.slack-edge.com/linux_releases/slack-desktop-3.4.2-amd64.deb" \
    "https://discordapp.com/api/download?platform=linux&format=deb"  \
    "https://www.jetbrains.com/toolbox/download/download-thanks.html?platform=linux" \
    "https://support.system76.com" \
    "https://extensions.gnome.org" \
    "https://code.visualstudio.com/docs/setup/linux" \
    "https://www.google.com/chrome" \
    "https://github.com/r-darwish/topgrade/releases/latest"

    #Ask for permission instead of the script default '-y'
    sudo apt-get autoclean
    sudo apt-get autoremove
} 2>&1 | sudo tee ${DIRECTORY}"$(basename "$0")".log

if [[ ! sugar_free -eq 1 ]]; then
    run_candy
fi

echo Remember to reboot! Log of the script execution stored at: "${DIRECTORY}""$(basename "$0")".log
