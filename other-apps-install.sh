#!/bin/bash
#install other software
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt install gimp inkscape obs-studio -y
