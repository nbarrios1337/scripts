#!/bin/bash

log_directory=/var/log/scripts/

#Mimics installation guide found here:
#https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-ubuntu-16-04
{
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip python3-venv \
        build-essential libssl-dev libffi-dev python-dev

    #TODO ask user for env directory location
    mkdir -p "$HOME"/dev/python/environments

} 2>&1 | sudo tee "${log_directory}""$(basename "$0")".log

echo "$0": Log of the Python3 installation stored at: "${log_directory}""$(basename "$0")".log
