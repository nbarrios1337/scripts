#!/bin/bash

log_directory=/var/log/scripts/
#Added logging capability to check if script ever runs
{
    read -r -p "Set your git username" username
    git config --global user.name "$username"
    read -r -p "Set your git email" email
    git config --global user.name "$email"
} 2>&1 | sudo tee "${log_directory}""$(basename "$0")".log

echo "$0": Log of the script execution stored at: "${log_directory}""$(basename "$0")".log
