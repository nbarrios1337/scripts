#!/bin/bash

log_directory=/var/log/scripts/

{
    cp ~/.bashrc ~/.bashrc.backup
    #Bonsai.sh steup and install (Copied from https://gitlab.com/jallbrit/bonsai.sh/blob/master/README.md#manual-install)
    git clone https://gitlab.com/jallbrit/bonsai.sh ~/bin/bonsai.sh
    chmod +x ~/bin/bonsai.sh/bonsai.sh
    ln -s ~/bin/bonsai.sh/bonsai.sh ~/.local/bin/bonsai
    echo "alias bonsai='~/bin/bonsai.sh/bonsai.sh'" >>~/.bashrc

    #TMatrix  setup and install (Copied from https://github.com/M4444/TMatrix/blob/master/README.md#download-and-install-on-other-gnulinux-distributions)
    sudo apt-get install -y libncurses5
    wget -q https://github.com/M4444/TMatrix/releases/download/v1.1/installation.tar.gz
    tar -zxvf installation.tar.gz
    cd installation || (echo "TMatrix extract failed." && exit)
    sudo ./install.sh

    #cheat.sh client setup and install (Copied from https://github.com/chubin/cheat.sh#installation)
    sudo apt-get install -y rlwrap
    mkdir -p ~/bin/
    curl https://cht.sh/:cht.sh >~/bin/cht.sh
    chmod +x ~/bin/cht.sh
    echo "alias cheat='cht.sh'" >>~/.bashrc

    #one call to reload the aliases
    source ~/.bashrc
} 2>&1 | sudo tee "${log_directory}""$(basename "$0")".log

echo "$0": Log of the script execution stored at: "${log_directory}""$(basename "$0")".log
