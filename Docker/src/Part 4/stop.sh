#!/bin/bash

docker stop hello_name
docker rm hello_name
docker rmi -f name_repo:tag