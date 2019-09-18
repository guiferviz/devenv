
IMAGE_NAME = guiferviz/devenv
INSTALL_SCRIPT_NAME = devenv


all: Dockerfile
	docker build -t $(IMAGE_NAME) .

nocache: Dockerfile
	docker build --no-cache -t $(IMAGE_NAME) .

test:
	docker run --rm \
		--gpus all \
		-e DISPLAY=${DISPLAY} \
		--network=host \
		-v ${XAUTHORITY}:/root/.Xauthority \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		-v ~/.ssh:/root/.ssh \
		-v ${PWD}:/workspace \
		-ti ${IMAGE_NAME} bash

run:
	docker run \
		--gpus all \
		-e DISPLAY=${DISPLAY} \
		--network=host \
		-v ${XAUTHORITY}:/root/.Xauthority \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		-v ~/.ssh:/root/.ssh \
		-v ${PWD}:/workspace \
		--name devenv \
		-ti ${IMAGE_NAME} bash

install:
	cp run_devenv.sh /usr/local/bin/$(INSTALL_SCRIPT_NAME) 

