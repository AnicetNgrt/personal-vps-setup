#!/bin/bash

echo "--------------------------------"
echo "------[SETTING UP APT-GET]------"
echo "--------------------------------"

sudo apt-get update

echo "--------------------------------"
echo "----[INSTALLING GIT & CURL]-----"
echo "--------------------------------"

sudo apt install curl git

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
echo "------[INSTALLING DOCKER]-------"
echo "--------------------------------"

apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo "--------------------------------"
echo "-----[DOCKERIZED POSTGRES]------"
echo "--------------------------------"

docker pull postgres:alpine
docker run --name postgres_1 -e POSTGRES_PASSWORD=$PGPASSWORD -d -p $PGPORT:5432 postgres:alpine

echo "--------------------------------"
echo "------[INSTALLING ASDF]---------"
echo "--------------------------------"

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc 
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc 

echo "--------------------------------"
echo "---------[ASDF ERLANG]----------"
echo "--------------------------------"

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

echo "--------------------------------"
echo "---------[ASDF ELIXIR]----------"
echo "--------------------------------"

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

echo "--------------------------------"
echo "-------[CLONE HYPOTHESES]-------"
echo "--------------------------------"

mkdir ./repos/hypotheses
cd ./repos/hypotheses
git clone https://github.com/AnicetNgrt/hypotheses.io.git .
cd ../../