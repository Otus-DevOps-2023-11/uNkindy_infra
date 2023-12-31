#!/bin/bash

###	Install Git
echo "Install Git..."
sudo apt install git

###	Clone Repo
echo "Clone Repository with app..."
cd ~/ && git clone -b monolith https://github.com/express42/reddit.git

### Install Bundle
echo "Install Bundle and deploy app..."
cd ~/reddit && bundle install
puma -d
