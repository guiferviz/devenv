
IMAGE_NAMESPACE = guiferviz
IMAGE_NAME = devenv
IMAGE = $(IMAGE_NAMESPACE)/$(IMAGE_NAME)
INSTALL_SCRIPT_NAME = devenv


all: Dockerfile
	docker build -t $(IMAGE) .

nocache: Dockerfile
	docker build --no-cache -t $(IMAGE) .

test:
	docker run --rm \
		--gpus all \
		-e DISPLAY=$(DISPLAY) \
		--network=host \
		-v $(XAUTHORITY):/root/.Xauthority \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		-v ~/.ssh:/root/.ssh \
		-v $(PWD):/workspace \
		-ti $(IMAGE) bash

run:
	docker run \
		--gpus all \
		-e DISPLAY=$(DISPLAY) \
		--network=host \
		-v $(XAUTHORITY):/root/.Xauthority \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		-v ~/.ssh:/root/.ssh \
		-v $(PWD):/workspace \
		--name devenv \
		-ti $(IMAGE) bash

install:
	sed -e "s/{{IMAGE}}/$(IMAGE_NAMESPACE)\/$(IMAGE_NAME)/" run_devenv.sh > /usr/local/bin/$(INSTALL_SCRIPT_NAME) 

