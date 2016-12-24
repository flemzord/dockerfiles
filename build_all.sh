#!/bin/bash

if [ "$1" == "build" ]; then
    for build in $(find ./* -name "build.sh" -print);
        do bash $build;
    done
fi

if [ "$1" == "push" ]; then
    for build in $(find ./* -name "build.sh" -print);
        do bash $build push;
    done
fi