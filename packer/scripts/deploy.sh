#!/bin/bash

###	Install Git
echo "Install Git..."
sudo apt install git -y

sleep 10
###	Clone Repo
echo "Clone Repository with app..."
cd ~/ && git clone -b monolith https://github.com/express42/reddit.git

sleep 10

### Install Bundle
echo "Install Bundle and deploy app..."
cd ~/reddit && bundle install

sleep 10

puma -d
