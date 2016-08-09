#!/bin/bash

# IP=`/sbin/ifconfig wlan0 | awk '/inet addr/{print substr($2,6)}'`
IP=`curl --silent ipecho.net/plain`
docker run -d --name ikev2 --privileged -p 500:500/udp -p 4500:4500/udp matrixanger/rpi-ikev2
docker run -i -t --rm --volumes-from ikev2 -e "HOST=$IP" matrixanger/rpi-ikev2 generate-mobileconfig > ikev2-vpn.mobileconfig
mv ikev2-vpn.mobileconfig ../nginx/html/
