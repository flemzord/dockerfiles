#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

if [ "$DOCKER_PUSH" == "build" ]; then
   #docker build -t flemzord/caddy:latest $FOLDER
fi

if [ "$DOCKER_PUSH" == "push" ]; then
   #docker push flemzord/caddy:latest
fi
