#!/bin/bash

docker-compose build
docker-compose up -d


sleep 1


echo ""
curl localhost:80
echo ""
curl localhost:80/status