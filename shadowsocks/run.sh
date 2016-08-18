#!/bin/bash
# pip install qrcode

IP=`curl --silent ipecho.net/plain`
PWD=`openssl rand -base64 16`
METHOD=aes-156-cfb

docker run  --name=shadowsocks -p 8388:8388 -d tommylau/shadowsocks -s $IP -p 8388 -k $PWD -m $METHOD

echo -n "ss://"`echo -n $METHOD:$PWD@$IP:8388 | base64` | qr > config.png
#or use qrencode

mv config.png ../nginx/html/
