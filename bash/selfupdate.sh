#!/bin/bash

echo "Stashing..."
git stash
echo "Pulling..."
git pull

for f in ./bash/*
do
    echo "Adding exec. rights to $f"
    chmod +x $f
done