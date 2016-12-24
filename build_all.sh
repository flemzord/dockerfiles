#!/bin/bash

if [ "$1" == "build" ]; then
    for build in $(find ./* -name "build.sh" -print);
        do sh $build;
    done
fi

if [ "$1" == "push" ]; then
    for build in $(find ./* -name "build.sh" -print);
        do sh $build push;
    done
fi