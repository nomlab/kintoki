#!/bin/bash

export LANG="ja_JP.UTF-8"
export TIMEZONE="Asia/Tokyo"
export DEBIAN_FRONTEND="noninteractive"

################################################################
### Setup Timezone

sudo sh -c "echo $TIMEZONE > /etc/timezone"
sudo dpkg-reconfigure -f noninteractive tzdata

################################################################
### update apt-get

sudo apt-get update

################################################################
### apt-get necessary packages

PACKAGES="git-core openssh-server"

################################################################
### apt-get machine-specific packages 
### libncurses5-dev is required for "make menuconfig"

if [ "$1" = "target" ]; then
    ADDITIONAL_PACKAGES="libncurses5-dev"
else
    # "observer" is assumed
    ADDITIONAL_PACKAGES="gdb"
fi

sudo apt-get install -y $PACKAGES $ADDITIONAL_PACKAGES
