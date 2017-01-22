#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1


if [ "$DOCKER_PUSH" == "build" ]; then
   docker build -t flemzord/nginx-php:latest $FOLDER
fi

if [ "$DOCKER_PUSH" == "push" ]; then
   docker push flemzord/nginx-php:latest
fi