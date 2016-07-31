#!/bin/bash

docker run --name ipsec --env-file ./l2tp.env -p 500:500/udp -p 4500:4500/udp -v /lib/modules:/lib/modules:ro -d --privileged jzstark/rpipsec
