
IMAGE_NAME = guiferviz/devenv
INSTALL_SCRIPT_NAME = devenv
DOCKER_USER = ${cat Dockerfile | grep "ENV DOCKER_USER" | awk  '{print $3}'}


all: Dockerfile
	docker build -t $(IMAGE_NAME) .

nocache: Dockerfile
	docker build --no-cache -t $(IMAGE_NAME) .

test:
	docker run --rm \
		-p 8888:8888 \
		-v ~/.ssh:/home/$(DOCKER_USER)/.ssh \
		-v ${PWD}:/home/$(DOCKER_USER)/workspace \
		-h devenv \
		-ti guiferviz/devenv bash

run:
	echo $0
	docker run \
		--gpus all \
		-p 8888:8888 \
		-v ~/.ssh:/home/$(DOCKER_USER)/.ssh \
		-v ${PWD}:/home/$(DOCKER_USER)/workspace \
		-h devenv \
		-ti guiferviz/devenv bash

install:
	make run -sn > /usr/local/bin/$(INSTALL_SCRIPT_NAME) 

