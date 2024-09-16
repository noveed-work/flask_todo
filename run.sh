#! /usr/bin/bash
docker rm -f docker ps -aq
docker rmi -f images
docker network create new-network
docker build -t todo-app .
docker build -t mynginx -f Dockerfile.nginx .
docker run -d --name todo-app --network new-network todo-app:latest
docker run -d -p 5000:5000 --name mynginx --network new-network mynginx:latest