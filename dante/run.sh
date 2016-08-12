#!/bin/bash
PWD=`pwd`
docker run --name dante -d -p 1080:1080 -v $PWD/sockd.conf:/etc/sockd.conf matrixanger/rpi-dante
