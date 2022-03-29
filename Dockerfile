#!/bin/bash
VERSION=$(date +%H-%M-%S)
docker build -t 9494482991/testingbuild:$(VERSION) .
docker push 9494482991/testingbuild:$(VERSION) .
docker -H tcp://10.0.1.200:2375 stop nginx
docker -H tcp://10.0.1.200:2375 run --rm -dit -p 8000:80 --name nginx --hostname nginx 9494482991/testingbuild:$(VERSION)
