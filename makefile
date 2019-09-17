
IMAGE_NAME = guiferviz/devenv
INSTALL_SCRIPT_NAME = devenv


all: Dockerfile
	docker build -t $(IMAGE_NAME) .

nocache: Dockerfile
	docker build --no-cache -t $(IMAGE_NAME) .

test:
	docker run --rm \
		--gpus all \
		-p 8888:8888 \
		-v ~/.ssh:/root/.ssh \
		-v ${PWD}:/workspace \
		-h devenv \
		-ti guiferviz/devenv bash

run:
	docker run \
		--gpus all \
		-p 8888:8888 \
		-v ~/.ssh:/root/.ssh \
		-v ${PWD}:/workspace \
		-h devenv \
		--name devenv \
		-ti guiferviz/devenv bash

install:
	cp run_devenv.sh /usr/local/bin/$(INSTALL_SCRIPT_NAME) 

