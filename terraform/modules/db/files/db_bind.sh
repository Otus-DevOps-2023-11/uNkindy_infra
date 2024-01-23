#!/bin/bash

while ps ax | grep -i [a]pt; do sleep 10; done;
sudo mv /tmp/mongodb.conf /etc/mongodb.conf
sudo systemctl restart mongodb
