#!/bin/bash
#install GCLOUD CLI
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
apt-get update
apt-get install apt-transport-https ca-certificates gnupg curl -y

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

apt-get update
apt-get install google-cloud-cli -y

#install kubectl
apt-get install kubectl
apt-get install google-cloud-cli-gke-gcloud-auth-plugin
echo "Finished. run 'gcloud init' to get started"

