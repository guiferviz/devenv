
IMAGE_NAMESPACE = guiferviz
IMAGE_NAME = python
IMAGE = $(IMAGE_NAMESPACE)/$(IMAGE_NAME)
IMAGE_DOCKERHUB = $(IMAGE)
INSTALL_SCRIPT_NAME = devenv_python


all: Dockerfile
	docker build -t $(IMAGE) .

nocache: Dockerfile
	docker build --no-cache -t $(IMAGE) .

test:
	docker run --rm \
		--network=host \
		-v $(PWD):/workspace \
		-ti $(IMAGE) bash

test-gpu:
	docker run --rm \
		--gpus all \
		--network=host \
		-v $(PWD):/workspace \
		-ti $(IMAGE) bash

install:
	devenv_python.sh > /usr/local/bin/$(INSTALL_SCRIPT_NAME) 

push:
	ifndef TAG
		$(error TAG is not set, please use: make push TAG=<my_tag_name_here>)
	endif
	docker tag $(IMAGE):$(TAG) $(IMAGE_DOCKERHUB):$(TAG)
	docker push $(IMAGE_DOCKERHUB):$(TAG)

