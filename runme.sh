#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [ "$1" == "nvidia" ]
  then ./nvidia-drivers-install.sh
elif [ "$1" == "amd" ]
  then ./ati-drivers.sh
elif [ "$1" == "nographics" ]
  then echo "Skipping graphics driver installation"
else
   echo "Please specify nvidia or amd for graphics. Or nographics for no graphics"
   exit 1
fi
./node-and-docker-update.sh
./install-vscode.sh
./gcloud-cli-install.sh
./other-apps-install.sh

echo "Installation complete."

echo "creating a symbolic link to the scripts directory in /usr/local/bin"
ln -s ./scripts /usr/local/bin

exit 0

