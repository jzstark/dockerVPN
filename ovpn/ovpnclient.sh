#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 DIRECTORY" >&2
  exit 1
fi
# clientname is the parameter
#Userinput: clientname (not more than 100 in total)

OVPN_DATA=ovpn-data
docker run --volumes-from $OVPN_DATA --rm -it matrixanger/rpi-ovpn easyrsa build-client-full $1 nopass
#User Output: OVPN Config
docker run --volumes-from $OVPN_DATA --rm matrixanger/rpi-ovpn ovpn_getclient $1 > $1.ovpn
