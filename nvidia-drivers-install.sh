#!/bin/bash
#This is for Debian 12 on a AMD64 machine
#run with sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt install linux-headers-amd64
echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list.d/non-free.list
apt update
apt install nvidia-driver firmware-misc-nonfree -y
cp /etc/modprobe.d/nvidia-options.conf /etc/modprobe.d/nvidia-options.conf.bak
echo "options nvidia-drm modeset=1" >> /etc/modprobe.d/nvidia-options.conf

read -p "Need to reboot. Reboot now? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    reboot now
fi


