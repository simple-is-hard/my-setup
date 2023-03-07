#!/bin/sh

# after wsl --install -d Debian

# Step to 10, might be a bit more reliable to do this way
sudo apt-get upgrade
sudo sed -i s/stretch/buster/g /etc/apt/sources.list
sudo apt-get install -y apt-transport-https
sudo apt-get update && sudo apt-get -y upgrade && sudo apt -y full-upgrade

sudo sed -i s/buster/bullseye/g /etc/apt/sources.list
sudo sed -i 's|bullseye/updates|bullseye-security|g' /etc/apt/sources.list

# Step to 11
cat <<CONFIG > /etc/apt/sources.list
# deb http://snapshot.debian.org/archive/debian/20230227T000000Z bullseye main
deb http://deb.debian.org/debian bullseye main
# deb http://snapshot.debian.org/archive/debian-security/20230227T000000Z bullseye-security main
deb http://deb.debian.org/debian-security bullseye-security main
# deb http://snapshot.debian.org/archive/debian/20230227T000000Z bullseye-updates main
deb http://deb.debian.org/debian bullseye-updates main
CONFIG

sudo apt-get update && sudo apt-get -y upgrade && sudo apt -y full-upgrade
