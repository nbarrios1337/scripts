#!/bin/bash

#Remember to 'chmod +x' this file

read -r -p "Set your git username" username
git config --global user.name "$username"
read -r -p "Set your git email" email
git config --global user.name "$email"
