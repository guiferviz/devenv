
IMAGE_NAMESPACE = guiferviz
IMAGE_NAME = latex
IMAGE = $(IMAGE_NAMESPACE)/$(IMAGE_NAME)
SCRIPT_NAME = devenv_latex.sh
INSTALL_SCRIPT_NAME = devenv_latex


all: Dockerfile
	docker build -t $(IMAGE) .

nocache: Dockerfile
	docker build --no-cache -t $(IMAGE) .

test:
	docker run --rm \
		-v $(PWD):/workspace \
		-ti $(IMAGE) bash

install:
	cp $(SCRIPT_NAME) /usr/local/bin/$(INSTALL_SCRIPT_NAME) 
	chmod +x /usr/local/bin/$(INSTALL_SCRIPT_NAME) 

