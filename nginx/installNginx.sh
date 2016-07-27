#!/bin/sh
DIR=~/Docker

docker run --name docker-nginx -p 80:80 -v $DIR/nginx/html:/usr/share/nginx/html -v $DIR/nginx/default.conf:/etc/nginx/conf.d/default.conf -d nginx

