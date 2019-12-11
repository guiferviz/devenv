#!/bin/bash

# Define constants.
IMAGE_NAMESPACE=guiferviz
IMAGE_NAME=python
IMAGE=$IMAGE_NAMESPACE/$IMAGE_NAME
CONTAINER_PREFIX="$IMAGE_NAME"_
GPU_PREFIX=gpu_

# Read input arguments.
NAME="$1"
# If not parameter use dir name.
if [ -z "$NAME" ]; then
    echo "Unspecified container name, using the directory name as the container name"
    NAME=$CONTAINER_PREFIX${PWD##*/}
fi

# Check if there is at least one GPU available.
GPU=false
if nvidia-smi -L | grep -q 'GPU 0:'; then
    GPU=true
    NAME=$GPU_PREFIX$NAME
fi
echo "GPU available: $GPU"

# Check if there is already a container with that name.
EXISTS=false
if [ $(docker container ls -a --format="{{.Names}}" | grep "^$NAME\$" | head -c1 | wc -c) -ne 0 ]; then
    EXISTS=true
fi
echo "Container \"$NAME\" already exists: $EXISTS"

# Excecute container.
if $EXISTS; then
    echo docker start -i "$NAME"
    docker start -i "$NAME"
else
    # Create args.
    args=()
    [ $GPU = true ] && args+=( "--gpus", "all" )
    args+=( "--network=host" )
    args+=( "-v" "$PWD:/workspace" )
    args+=( "--name=$NAME" )
    args+=( "-ti" )
    args+=( "$IMAGE" )
    args+=( "bash" )

    echo docker run "${args[@]}"
    docker run "${args[@]}"
fi

