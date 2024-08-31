#!/bin/bash

docker build . -t name_repo:tag
docker run -d -p 80:81 --name hello_name name_repo:tag
docker exec hello_name bash start_hello.sh

sleep 1

echo ""
curl localhost:80
echo ""
curl localhost:80/status