#!/bin/sh

cp ../shadowsocks/shadowsocks.md ./docs/
cp ../ovpn/openvpn.md ./docs/

mkdir -p ./docs/shadowsocks
mkdir -p ./docs/ovpn

cp ../shadowsocks/shadowsocks-qr-code.png ./docs/shadowsocks
cp ../ovpn/databox.ovpn ./docs/ovpn

mkdocs build 
rsync -r --delete ./site/ ../nginx/html
