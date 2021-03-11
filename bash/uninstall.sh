#!/bin/bash

export ENV=$1

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
echo "--------[UNINSTALLING ASDF]-------"
echo "----------------------------------"

rm -rf ${ASDF_DATA_DIR:-$HOME/.asdf} ~/.tool-versions
sed '/. $HOME/.asdf/asdf.sh/d' ~/.bashrc 
sed '/. $HOME/.asdf/completions/asdf.bash/d' ~/.bashrc 

echo "----------------------------------"
echo "------[UNINSTALLING DOCKER]-------"
echo "----------------------------------"

sudo apt-get purge docker-ce docker-ce-cli containerd.io
# DANGEROUS STUFF!!!
#sudo rm -rf /var/lib/docker
#sudo rm -rf /var/lib/containerd