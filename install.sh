#!/bin/bash

export ENV=prod

sudo apt-get install -y dos2unix # Installs dos2unix Linux
sudo find . -type f -exec dos2unix {} \; # recursively removes windows related stuff

source ./configs/$ENV/config.sh
source ./configs/$ENV/secrets.sh

sudo -u $USER git clone $HPTH_REPO_URL ./repos/$HPTH_DIR

docker-compose up