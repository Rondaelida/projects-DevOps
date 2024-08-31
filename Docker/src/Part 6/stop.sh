#!/bin/bash

docker stop name1
docker rm name1
docker stop name2
docker rm name2
docker rmi -f name_repo:tag