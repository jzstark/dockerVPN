#!/bin/sh

sudo apt-get install -y apt-transport-https
wget -q https://packagecloud.io/gpg.key -O - | sudo apt-key add -
echo 'deb https://packagecloud.io/Hypriot/Schatzkiste/debian/ jessie main' | sudo tee /etc/apt/sources.list.d/hypriot.list
sudo apt-get update
sudo apt-get install -y docker-hypriot docker-compose
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER
