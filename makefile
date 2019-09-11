
IMAGE_NAME = guiferviz/devenv
INSTALL_SCRIPT_NAME = devenv


all: Dockerfile
	docker build -t $(IMAGE_NAME) .

run:
	./run_devenv.sh

install:
	cp ./run_devenv.sh /usr/local/bin/$(INSTALL_SCRIPT_NAME) 

