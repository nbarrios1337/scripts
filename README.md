# Scripts

## Table of Contents

+ [About](#about)
+ [Getting Started](#getting-started)
+ [Usage](#usage)
<!--+ [Contributing](../CONTRIBUTING.md)-->

## About

This is a repository mainly for me to easily update shell scripts for anything I want to automate.

## Getting Started

[`pop-post-install.sh`](pop-post-install.sh) updates all the packages in the distro, installs a select few apps, like Steam and gnome-tweaks, and the opens some links to more software that isn't listed in a repository.

[`candy.sh`](candy.sh) installs miscellaneous eye-candy for the terminal (hence the script name), like tmatrix, a cmatrix-like program.

### Prerequisites

[`pop-post-install.sh`](pop-post-install.sh) has been made to work with Pop!\_OS, specifically Pop!\_OS 19.04 (19.04 is the version I use and have tested [`pop-post-install.sh`](pop-post-install.sh) with). See [the Pop!\_OS website](https://system76.com/pop) for more information about the distribution.

### Installing

[`pop-post-install.sh`](pop-post-install.sh) is meant to be run immediately after finishing the distro installation. It runs [`candy.sh`](candy.sh) afterwards, unless `-s` or `--sugar-free` is specified.

Downloading the script (preferably in your `$HOME` directory):

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

[`candy.sh`](candy.sh) requires similar installation steps. Simply replace all instances of `pop-post-install.sh` with `candy.sh` in the above steps. Like so:

```bash
wget https://raw.githubusercontent.com/nbarrios1337/scripts/master/candy.sh
chmod +x candy.sh
```

For a general installation steps:

1. clone the repo OR pull the latest changes if already cloned.
2. Move the scripts you'd like to use to your `$HOME` directory

3. ```bash
    chmod +x {first script} {second script} ... {nth script}
    ```

Note: chmod accepts multiple filenames as arguments; i.e. calling `chmod +x a.sh b.sh` sets both `a.sh` and `b.sh` to be exectuable. There are ways change permissions in bulk ([see this StackOverflow answer](https://stackoverflow.com/questions/6874618/changing-the-file-permissions-of-multiple-files-through-unix-terminal)), but I recommend not doing so, since it's highly likely you'd have other `.sh` files in your `$HOME` directory.

## Usage

To run a script:

```bash
./{script name}
```

For example, after setting [`pop-post-install.sh`](pop-post-install.sh) to be executable:

```bash
./pop-post-install.sh
```

And if you'd like to run it without having the script run [`candy.sh`](candy.sh):

```bash
./pop-post-install.sh --sugar-free
```
