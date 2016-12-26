#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

if [ "$DOCKER_PUSH" == "build" ]; then
   docker build -t flemzord/php:7.0 $FOLDER/7.0
   docker build -t flemzord/php:7.1 $FOLDER/7.1
fi

if [ "$DOCKER_PUSH" == "push" ]; then
   docker push flemzord/php:7.0
   docker push flemzord/php:7.1
fi