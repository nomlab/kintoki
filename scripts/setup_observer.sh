#! /bin/bash

# update apt-get
sudo apt-get update

#keyboard layout
sudo localectl set-keymap jp106
setxkbmap jp

# editor
sudo apt-get install -y emacs
sudo apt-get install -y vim

# git
sudo apt-get install -y git
git config --global user.name "Iori Ogura"
git config --global user.email "barojuu@gmail.com"
git config --global core.editor 'vim -c "set fenc=utf-8"'

# for "make menuconfig"
sudo apt-get install -y libncurses5-dev

# ssh
sudo apt-get install -y openssh-server

# GDB
sudo apt-get install -y gdb

