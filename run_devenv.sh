
docker run --rm \
	-v ~/.ssh:/home/guiferviz/.ssh \
	-v $(echo $PWD):/home/guiferviz/workspace \
	-h devenv \
	-ti guiferviz/devenv bash

