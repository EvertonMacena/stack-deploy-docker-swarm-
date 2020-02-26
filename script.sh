#!/bin/sh
# create temporary register docker
docker service create --name registry --publish published=5000,target=5000 registry:2

# build image and send register created
docker-compose build
docker-compose push

# stack deploy
docker stack deploy -c docker-compose.yml app-python-swarm