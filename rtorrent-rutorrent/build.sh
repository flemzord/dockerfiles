#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

# Download dependencies
docker pull alpine:3.4

# Build rtorrent-rutorrent
docker build -t flemzord/rtorrent-rutorrent:latest $FOLDER
docker build --build-arg WITH_FILEBOT=YES -t flemzord/rtorrent-rutorrent:filebot $FOLDER
docker tag flemzord/rtorrent-rutorrent:filebot flemzord/rtorrent-rutorrent:latest-filebot

if [ "$DOCKER_PUSH" == "push" ]; then
  for tag in latest filebot latest-filebot; do
    docker push flemzord/rtorrent-rutorrent:$tag
  done
fi