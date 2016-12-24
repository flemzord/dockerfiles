#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

# Download dependencies
docker pull alpine:3.4

# Build rtorrent-rutorrent
docker build -t flemzord/rtorrent:latest $FOLDER

if [ "$DOCKER_PUSH" == "push" ]; then
   docker push flemzord/rtorrent:latest
fi