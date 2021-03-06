#!/bin/bash

export ENV=$1

cd ../

echo "--------------------------------"
echo "----[CONVERTING TO UNIX FF]-----"
echo "--------------------------------"

sudo apt-get install -y dos2unix
sudo find . -type f -exec dos2unix {} \;

echo "--------------------------------"
echo "------[LOADING ENV VARS]--------"
echo "--------------------------------"

source ./configs/$ENV/config.sh
source ./configs/$ENV/secrets.sh

echo "----------------------------------"
echo "--------[UNINSTALLING KIEX]-------"
echo "----------------------------------"

rm -r $HOME/.kiex.

echo "----------------------------------"
echo "------[UNINSTALLING DOCKER]-------"
echo "----------------------------------"

sudo apt-get purge docker-ce docker-ce-cli containerd.io
# DANGEROUS STUFF!!!
#sudo rm -rf /var/lib/docker
#sudo rm -rf /var/lib/containerd