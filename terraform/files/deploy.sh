#!/bin/bash
set -e
APP_DIR=${1:-$HOME}
sleep 30
sudo apt-get install -y git
sleep 30
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
sleep 30
cd $APP_DIR/reddit
bundle install
sudo mv /tmp/reddit.service /etc/systemd/system/reddit.service
sudo systemctl start reddit.service
sudo systemctl enable reddit.service
