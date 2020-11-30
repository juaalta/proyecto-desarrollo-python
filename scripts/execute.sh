#!/bin/bash

####################
###   Binaries   ###
####################
DOCKER=$(which docker)
####################

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
PROJECT_NAME="$(cd $PROJECT_PATH && ./scripts/app_name.sh)"

echo "[$(date +"%Y-%m-%d %T")] Executing the python command: $@"
# echo $PROJECT_PATH
# echo $PWD
# echo $HOME
# echo $PROJECT_NAME

${DOCKER} run -it --rm --name $PROJECT_NAME -v "$PWD/src"/.:/usr/src/app -w /usr/src/app python:3.8 python $@
