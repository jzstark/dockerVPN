#!/bin/bash

docker run  --name=shadowsocks -p 8388:8388 -d tommylau/shadowsocks -s 0.0.0.0 -p 8388 -k 123456 -m aes-256-cfb
