#!/bin/sh

echo "--upgrading packages"
sudo apt update && apt upgrade -y

echo "-- installing dependancies: golang git debianutils make"
sudo apt install -y golang git debianutils make

echo "-- Downloading cloudflared source"
git clone https://github.com/cloudflare/cloudflared.git --depth=1
cd cloudflared
sed -i 's/linux/android/g' Makefile

echo "-- Building and installing cloudflared"
make cloudflared

echo "-- Success Building!"
ls
