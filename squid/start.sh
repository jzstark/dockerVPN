#!/bin/bash
PWD=`pwd`
LOG=/var/log/squid
# sudo mkdir -p $LOG

#docker run  -v $PWD/squid.conf:/etc/squid/squid.conf:ro \
#            -v <configPath/cache:/var/cache/squid:rw \
#            -v /var/log/squid:/var/log/squid:rw \
#            -v /etc/localtime:/etc/localtime:ro \
#            -p 3128:3128 \
#            matrixanger/rpi-squid 

docker run --name squid -d -v $PWD/squid.conf:/etc/squid/squid.conf:ro -v $LOG:/var/log/squid:rw -p 3128:3128 matrixanger/rpi-squid

## Reload Squid
# docker kill -s HUP squid

## Linux Client: in .bashrc:

#export ftp_proxy=http://172.17.42.1:3128
#export http_proxy=http://172.17.42.1:3128
#export https_proxy=http://172.17.42.1:3128

## Logs:
# docker exec -it squid tail -f /var/log/squid3/access.log

## Shell Access:
# docker exec -it squid bash
