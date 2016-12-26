#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

if [ "$DOCKER_PUSH" == "build" ]; then
   docker build -t flemzord/sickrage:latest $FOLDER
fi

if [ "$DOCKER_PUSH" == "push" ]; then
   docker push flemzord/sickrage:latest
fi