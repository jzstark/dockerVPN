#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 DIRECTORY" >&2
  exit 1
fi
# clientname is the parameter
#Userinput: clientname (not more than 100 in total)
docker run --volumes-from ovpn-data --rm -it kylemanna/openvpn easyrsa build-client-full $1 nopass
#User Output: OVPN Config
docker run --volumes-from ovpn-data --rm kylemanna/openvpn ovpn_getclient $1 > $1.ovpn
