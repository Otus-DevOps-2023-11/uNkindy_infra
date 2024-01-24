#!/bin/bash
set -e
APP_DIR=${1:-$HOME}
while ps ax | grep -i [a]pt; do sleep 10; done;
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install
sudo mv /tmp/reddit.service /etc/systemd/system/reddit.service
sudo systemctl start reddit.service
sudo systemctl enable reddit.service
