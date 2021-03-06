#!/bin/bash

blu="\\033[0;34m"
gre="\\033[1;32m"

if [ "$1" == "build" ]; then
    for build in $(find ./* -name "build.sh" -print);
        do
        	chmod +x $build &&  
        	echo -ne "${gre} [BUILD] ${blu} --> Launch $build" && 
        	bash $build build >> /dev/null;
    done
fi

if [ "$1" == "push" ]; then
    for build in $(find ./* -name "build.sh" -print);
        do
        	chmod +x $build &&  
        	echo -ne "${gre} [PUSH] ${blu} --> Launch $build" && 
        	bash $build push >> /dev/null;
    done
fi

if [ "$1" == "all" ]; then
    for build in $(find ./* -name "build.sh" -print);
        do
        	chmod +x $build &&  
        	echo -ne "${gre} [BUILD] ${blu} --> Launch $build \n" && 
        	bash $build build >> /dev/null &&
        	echo -ne "${gre} [PUSH] ${blu} --> Launch $build \n" && 
        	bash $build push >> /dev/null;
    done
fi