#!/bin/bash

REPO='https://github.com/flemzord/dockerfiles.git'
BRANCH='master'
USER='flemzord'
DOCKER_PUSH=$1
ERROR=0

CSI="\033["
CEND="${CSI}0m"
CRED="${CSI}1;31m"
CGREEN="${CSI}1;32m"
CYELLOW="${CSI}1;33m"
CBLUE="${CSI}1;34m"

git fetch -q "$REPO" "refs/heads/$BRANCH"

for f in $(git diff HEAD~ --diff-filter=ACMRTUX --name-only | cut -d"/" -f1 | uniq); do
    if [ -d $f ]; then
        if [ -e $f/build.sh ]; then
            chmod +x $f/build.sh
            echo 
            ./$f/build.sh $DOCKER_PUSH
        else
            for dockerfile in $(find $f -name Dockerfile); do
                FOLDER=$(dirname $dockerfile)
                LOG_FILE="/tmp/${f}_$(date +%Y%m%d).log"
                echo -e "Build $dockerfile with context $FOLDER on tmp-build [${CYELLOW}..${CEND}]"
                docker build -f $dockerfile -t tmp-build $FOLDER > $LOG_FILE 2>&1
                if [ $? != 0 ]; then
                    echo -e "Build $dockerfile with context $FOLDER on tmp-build [${CRED}KO${CEND}]"
                    ERROR=1
                    cat $LOG_FILE
                else
                    echo -e "Build $dockerfile with context $FOLDER on tmp-build [${CGREEN}OK${CEND}]"
                    for tag in $(grep "tags=" $dockerfile | cut -d'"' -f2); do
                        echo -e "Tags tmp-build to ${USER}/${f}:${tag} [${CYELLOW}..${CEND}]"
                        docker tag tmp-build ${USER}/${f}:${tag}
                        if [ $? != 0 ]; then
                            echo -e "Tags tmp-build to ${USER}/${f}:${tag} [${CRED}KO${CEND}]"
                            ERROR=1
                        else
                            echo -e "Tags tmp-build to ${USER}/${f}:${tag} [${CGREEN}OK${CEND}]"
                            if [ "$DOCKER_PUSH" == "push" ]; then
                                echo -e "Push ${USER}/${f}:${tag} [${CYELLOW}..${CEND}]"
                                docker push ${USER}/${f}:${tag} > $LOG_FILE 2>&1
                                if [ $? != 0 ]; then
                                    echo -e "Push ${USER}/${f}:${tag} [${CRED}KO${CEND}]"
                                    ERROR=1
                                    cat $LOG_FILE
                                else
                                    echo -e "Push ${USER}/${f}:${tag} [${CGREEN}OK${CEND}]"
                                fi
                            fi
                        fi
                    done
                fi
            done
            docker images | grep tmp-build > /dev/null 2>&1
            if [ $? -eq 0 ]; then docker rmi tmp-build; fi
        fi
        
    fi
done
