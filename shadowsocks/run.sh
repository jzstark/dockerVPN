#!/bin/bash

docker run --name=shadows -p 8388:8388 -d matrixanger/rpi-shadowsocks -s 0.0.0.0 -p 8388 -k 123456 -m aes-256-cfb

