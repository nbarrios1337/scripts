#!/bin/bash

log_directory=/var/log/scripts/

sugar_free=0
manual=0

while [ -n "$1" ]; do
    case $1 in
    -s | --sugar-free)
        sugar_free=1
        ;;

    -m | --manual)
        manual=1
        ;;
    *)
        echo Invalid argument: "$1" >&2
        exit 1
        ;;
    esac
    shift
done

script_run() {
    if [[ -e "$1" ]]; then
        echo "$1" does not exist. >&2
        return
    elif [[ -x "$1" ]]; then
        echo "$1" is not executable. >&2
        return
    fi

    #if we're looking to run candy.sh but --sugar-free has been passed in as a command line arg
    if [[ $1 == "./candy.sh" && $sugar_free -eq 1 ]]; then
        return
    fi

    $1
}

sudo mkdir -p ${log_directory}
{
    #Just in Case (TM)
    sudo add-apt-repository -y universe
    sudo add-apt-repository -y restricted
    sudo add-apt-repository -y multiverse

    #Update all packages after all repos have been added
    sudo apt-get update
    sudo apt-get dist-upgrade -y

    sudo apt-get install -y \
        libxss1 libappindicator1 libappindicator7 \
        flatpak gnome-software-plugin-flatpak \
        gnome-tweak-tool gnome-tweaks gnome-shell-extensions \
        powertop neofetch vlc hub steam nvme-cli shellcheck \
        silversearcher-ag mps-youtube

    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    snap install spotify tldr
    #The Help article calls for sudo snap instead of just snap
    #https://get.slack.help/hc/en-us/articles/212924728-Download-Slack-for-Linux-beta-#ubuntu-1
    sudo snap install slack --classic

    #apt considers pop-desktop for removal, manually install.
    sudo apt-get install -y pop-desktop sessioninstaller

    #Chrome Browser setup and install
    wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    #sudo apt-get install -f
    rm -f ./google-chrome-stable_current_amd64.deb

    #Keybase setup and install (Copied from https://keybase.io/docs/the_app/install_linux#ubuntu-debian-and-friends)
    curl -sS --remote-name "https://prerelease.keybase.io/keybase_amd64.deb"
    # if you see an error about missing `libappindicator1` from the next
    # command, you can ignore it, as the subsequent command corrects it
    sudo dpkg -i keybase_amd64.deb
    #sudo apt-get install -f
    run_keybase
    rm -f ./keybase_amd64.deb

    #Discord setup and install
    wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
    sudo dpkg -i discord.deb
    sudo apt-get install -f
    rm -f ./discord.deb

    firefox \
        "https://www.jetbrains.com/toolbox/download/download-thanks.html?platform=linux" \
        "https://support.system76.com" \
        "https://extensions.gnome.org"

    #Ask for permission instead of the script default '-y'
    sudo apt-get autoclean
    sudo apt-get autoremove
} 2>&1 | sudo tee "${log_directory}""$(basename "$0")".log

#automatic setting execute bit for scripts unless --manual has been passed
if [[ ! $manual -eq 1 ]]; then
    #Removes the current running script from scripts.txt
    #Sets all script files to be executable.
    sed '/'"$(basename "$0")"'/d' <./scripts.txt | xargs chmod +x
fi

while read -r line; do
    script_run "$line"
done <"scripts.txt"

echo "$0": Remember to reboot! Log of the script execution stored at: "${log_directory}""$(basename "$0")".log
