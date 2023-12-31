#!/bin/bash

###	Install Mongo DB

echo "Install MongoDB..."
apt-get install mongodb -y

sleep 10

echo "Enable MongoDB..."

systemctl enable mongodb
