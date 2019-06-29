#!/bin/bash

#Remember to 'chmod +x' this file

log_directory=/var/log/scripts/
user_settings_path="$HOME"/.config/Code/User/settings.json

{
    #VSCode setup and installation (Copied from https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions)
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y code

    #Use VSCode as the default editor for git
    git config --global core.editor "code --wait"

    code --install-extension --force ms-python.python
    code --install-extension --force ms-vscode.cpptools
    code --install-extension --force eamodio.gitlens
    code --install-extension --force vscjava.vscode-java-pack
    code --install-extension --force vscode-icons-team.vscode-icons
    code --install-extension --force DavidAnson.vscode-markdownlint
    code --install-extension --force timonwong.shellcheck
    code --install-extension --force foxundermoon.shell-format

} 2>&1 | sudo tee "${log_directory}""$(basename "$0")".log

echo "$0": Log of Visual Studio Code installation stored at: "${log_directory}""$(basename "$0")".log
