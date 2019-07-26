#!/bin/bash

# Parameters
CONFIG_PATH="/etc/docker/aet"
DOCKER_IP="192.168.59.12"

# Install required dependencies
apk add jq libxml2-utils git docker

# Start Docker
/etc/init.d/docker start

# Get AET docker repository
git clone https://github.com/Skejven/aet-docker.git $CONFIG_PATH

# Start Docker Swarm and initiate aet service
docker swarm init --advertise-addr $DOCKER_IP
docker stack deploy -c $CONFIG_PATH/example-aet-swarm/aet-swarm.yml aet

