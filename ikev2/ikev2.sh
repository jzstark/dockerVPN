#!/bin/bash

IP=`/sbin/ifconfig eth0 | awk '/inet addr/{print substr($2,6)}'`
docker run -d --name ikev2 --privileged -p 500:500/udp -p 4500:4500/udp gaomd/ikev2-vpn-server
docker run -i -t --rm --volumes-from ikev2 -e "HOST=$IP" gaomd/ikev2-vpn-server generate-mobileconfig > ikev2-vpn.mobileconfig
mv ikev2-vpn.mobileconfig ../nginx/html/
