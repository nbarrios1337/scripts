# Scripts

## Table of Contents
+ [About](#about)
+ [Getting Started](#getting_started)
+ [Usage](#usage)
<!--+ [Contributing](../CONTRIBUTING.md)-->

## About <a name = "about"></a>
This is a repository mainly for me to easily update shell scripts for anything I want to automate.

## Getting Started <a name = "getting_started"></a>
There isn't much to say here, since at the moment there is only one script.

### Prerequisites
[pop-post-install.sh](pop-post-install.sh) has been made to work with Pop!\_OS, specifically Pop!\_OS 19.04 (19.04 is the version I use and have tested [pop-post-install.sh](pop-post-install.sh) with). See [the Pop!\_OS website](https://system76.com/pop) for more information about the distribution.

### Installing
[pop-post-install.sh](pop-post-install.sh) is meant to be run immediately after finishing the distro installation.

Downloading the script (preferably in your home directory):
```bash
wget https://raw.githubusercontent.com/nbarrios1337/scripts/master/pop-post-install.sh
```
Set the script to be executable:

```bash
chmod +x pop-post-install.sh
```

If you'd like to copy/paste the commmands all together:
```bash
wget https://raw.githubusercontent.com/nbarrios1337/scripts/master/pop-post-install.sh
chmod +x pop-post-install.sh
```

<!--End with an example of getting some data out of the system or using it for a little demo.-->

## Usage <a name = "usage"></a>
To run a script:
```bash
./{script name}
```

For example, after setting [pop-post-install.sh](pop-post-install.sh) to be executable:
```bash
./pop-post-install.sh
```
