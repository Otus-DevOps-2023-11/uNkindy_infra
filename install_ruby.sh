#!/bin/bash

echo "Update apt..."
sudo apt update

echo "Install ruby and bundler..."
sudo apt install -y ruby-full ruby-bundler build-essential
