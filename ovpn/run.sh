#!/bin/bash

# Set up Certificate Store
OVPN_DATA="ovpn-data"
IFACE=wlan0
docker run --name $OVPN_DATA -v /etc/openvpn hypriot/armhf-busybox

# IP=`/sbin/ifconfig $IFACE | awk '/inet addr/{print substr($2,6)}'`
IP=`curl --silent ipecho.net/plain`
docker run --volumes-from $OVPN_DATA --rm matrixanger/rpi-ovpn ovpn_genconfig -u udp://$IP
docker run --volumes-from $OVPN_DATA --rm -it matrixanger/rpi-ovpn ovpn_initpki

# Run OpenVPN
OVPN_DATA=ovpn-data
docker run --name ovpn --volumes-from $OVPN_DATA -d -p 1194:1194/udp --cap-add=NET_ADMIN matrixanger/rpi-ovpn
