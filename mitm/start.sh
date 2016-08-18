#!/bin/bash

# docker run --rm -it [-v ~/.mitmproxy:/home/mitmproxy/.mitmproxy] -p 8080:8080 mitmproxy/mitmproxy
docker run --rm -it -p 8080:8080 mitmproxy/mitmproxy
