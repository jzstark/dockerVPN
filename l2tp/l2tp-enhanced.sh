#!/bin/sh

# Run
# docker run --name ipsec --env-file ./l2tp.env -p 500:500/udp -p 4500:4500/udp -v /lib/modules:/lib/modules:ro -d --privrileged jzstark/l2tp:0.7

# Run with env file
docker run --name ipsec -p 500:500/udp -p 4500:4500/udp -v /lib/modules:/lib/modules:ro -d --privileged jzstark/l2tp:0.7

# Generate mobileconfig file
docker exec ipsec generate-mobileconfig > ../nginx/html/l2tp-vpn.mobileconfig

# This is WRONG!!!!
# docker run jzstark/l2tp:0.7 generate-mobileconfig > ../nginx/html/l2tp-vpn.mobileconfig
