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

echo "--------------------------------"
echo "--------[UPDATING KIEX]---------"
echo "--------------------------------"

$HOME/.kiex/scripts/kiex selfupdate

echo "--------------------------------"
echo "--------[PULL HYPOTHESES]-------"
echo "--------------------------------"

cd ./repos/hypotheses
git pull
cd ../../