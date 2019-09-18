#!/bin/sh

if docker run \
    --gpus all \
    -e DISPLAY=${DISPLAY} \
    --network=host \
    -v ${XAUTHORITY}:/root/.Xauthority \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v ~/.ssh:/root/.ssh \
    -v ${PWD}:/workspace \
    --name "$1" \
    -ti \
    guiferviz/devenv bash; then
	:
else
	docker start -i "$1"
fi

