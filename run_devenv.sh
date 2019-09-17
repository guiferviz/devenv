#!/bin/sh

docker run \
    --gpus all \
    -p 8888:8888 \
    -v ~/.ssh:/root/.ssh \
    -v ${PWD}:/workspace \
    -h devenv \
    --name devenv \
    -it \
    guiferviz/devenv bash

#docker start -i devenv

