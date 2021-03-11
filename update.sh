#!/bin/bash

export ENV=prod

sudo apt-get install -y dos2unix # Installs dos2unix Linux
sudo find . -type f -exec dos2unix {} \; # recursively removes windows related stuff

source ./configs/$ENV/config.sh
source ./configs/$ENV/secrets.sh

cd ./repos/"$HPTH_DIR"
git pull
cd ../../

docker-compose build
docker-compose up