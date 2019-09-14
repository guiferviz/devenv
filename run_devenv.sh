#!/bin/sh

docker run \
	-v ~/.ssh:/home/guiferviz/.ssh \
	-v $PWD:/home/guiferviz/workspace \
	-h devenv \
	--name mydevenv \
	-ti guiferviz/devenv bash

