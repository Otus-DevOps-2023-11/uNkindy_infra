#!/bin/bash

###	Install Mongo DB

echo "Install MongoDB..."

sleep 10
sudo apt-get install mongodb -y

sleep 10

echo "Enable MongoDB..."

systemctl enable mongodb
