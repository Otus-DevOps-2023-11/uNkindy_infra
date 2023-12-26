#!/bin/bash

###	Install Mongo DB

echo "Install MongoDB..."
sudo apt install mongodb -y

echo "Enable and start MongoDB..."
sudo systemctl start mongodb
sudo systemctl enable mongodb
