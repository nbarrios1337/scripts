# Scripts
[![Build Status](https://travis-ci.com/nbarrios1337/scripts.svg?branch=master)](https://travis-ci.com/nbarrios1337/scripts)

## Table of Contents

+ [About](#about)
+ [Getting Started](#getting-started)
+ [Usage](#usage)
<!--+ [Contributing](../CONTRIBUTING.md)-->

## About

This is a repository mainly for me to easily update shell scripts for anything I want to automate.

## Getting Started

[`post-install.sh`](post-install.sh) updates all the packages in the distro, installs a select few apps, like Steam and gnome-tweaks, opens some links to more software that isn't listed in a repository and finally runs the scripts in [`scripts.txt`](scripts.txt).

[`candy.sh`](candy.sh) installs miscellaneous eye-candy for the terminal (hence the script name), like tmatrix, a cmatrix-like program.

[`git-setup.sh`](git-setup.sh), [`python-setup.sh`](python-setup.sh), and [`vscode-setup.sh`](vscode-setup.sh) are self-explanatory. As to why I made seperate scripts for each type of setup, it's part of my progress in making each script work as standalone files.

[`.update.sh`](.update.sh) provides a convenient way to automatically update [`scripts.txt`](scripts.txt) when creating or deleting new `.sh` files. In fact, any script you add to [`scripts.txt`](scripts.txt) (Remember to include the `./` at the beginning of each name!) would be set executable and run by [`post-install.sh`](post-install.sh)

### Prerequisites

The scripts should be able to run on any Ubuntu derivative (i.e. has `apt` and Canonical's package repositories). I use and have tested this on Pop!\_OS 19.04.

### Installing

1. Clone the repo as you would normally clone any git repository.
2. Set the script to be executable: `chmod +x post-install.sh`
    1. If you plan to pass in `--manual`, repeat the step above for each script in [`scripts.txt`](scripts.txt)
3. Run `./post-install.sh`

## Usage

[`post-install.sh`](post-install.sh) is meant to be run immediately after finishing the distro installation. It runs the scripts listed in [`scripts.txt`](scripts.txt) by setting all but [`post-install.sh`](post-install.sh) to be exectuable.

You can disable the automatic executing setting by passing in `-m` or `--manual` when running [`post-install.sh`](post-install.sh). You will have to manuall set each file to be executable before running [`post-install.sh`](post-install.sh)

To not run [`candy.sh`](candy.sh), pass in `-s` or `--sugar-free`.
