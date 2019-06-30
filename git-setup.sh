#!/bin/bash

read -r -p "Set your git username" username
git config --global user.name "$username"
read -r -p "Set your git email" email
git config --global user.name "$email"
