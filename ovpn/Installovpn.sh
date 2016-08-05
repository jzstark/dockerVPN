#!/bin/bash

# Set up Certificate Store
OVPN_DATA="ovpn-data"
docker run --name $OVPN_DATA -v /etc/openvpn hypriot/armhf-busybox

# Userinput: wlan0 or eth0
# IP=`/sbin/ifconfig wlan0 | awk '/inet addr/{print substr($2,6)}'`
IP=`curl --silent ipecho.net/plain`
docker run --volumes-from $OVPN_DATA --rm matrixanger/rpi-ovpn ovpn_genconfig -u udp://$IP
docker run --volumes-from $OVPN_DATA --rm -it matrixanger/rpi-ovpn ovpn_initpki

