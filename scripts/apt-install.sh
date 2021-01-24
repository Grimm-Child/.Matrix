#!/bin/bash

# Install script for apt packages on a fresh Ubuntu set-up.
# Note to self - Don't forget to run the following commands:
# $ chmod +x apt-install.sh
# $ ./apt-install.sh

# Copy dotfiles
./symlink.sh

# Update Ubuntu to start with...
sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install autoconf
install automake
install awscli
install bash
install core-utils
install curl
install exfat-utils
install file
install findutils
install gettext
install git
install git-all
install git-core
install grep
install iputils
install iproute2
install licenses
install libtool
install make
install npm
install nodejs
install openvpn
install openssh-server
install openssl
install pkgconf
install postgresql-client-common
install postgresql 
install postgresql-contrib
install postgresql-client
install python
install python3.8
install python3-pip
install python3-dev
install python-openssl
install sed
install screen
install systemd
install systemd-sysvcompat
install tmux
install tar
install ubuntu-wsl
install util-linux
install vim
install wget
install which
install yarn

# Dev
install build-essential
install direnv
install g++
install gcc
install gcc-libs
install llvm
install python3-venv
install tcl-dev
install tk
install tk-dev
install xz-utils

# Libraries
install libapache2-mod-wsgi
install libbz2-dev 
install libexpat1-dev 
install libffi-dev 
install libgdbm-dev 
install liblzma-dev 
install libmysqlclient-dev 
install libncurses5-dev 
install libncursesw5-dev
install libpq-dev
install libpython2-dev 
install libpython3-dev 
install libreadline-dev 
install libsqlite3-dev 
install libssl-dev 
install zlib1g-dev

# Security
install apt-transport-https
install ca-certificates
install linux-headers-generic
install software-properties-common

# Fun stuff
install figlet
install fonts-powerline
install lolcat

# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

# Fun hello
figlet "Hello!" | lolcat