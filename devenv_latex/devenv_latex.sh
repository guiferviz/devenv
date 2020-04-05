
sudo docker run \
    --user $(id -u):$(id -g) \
    -v $PWD:/workspace \
    -ti guiferviz/latex \
    ${@:-make}

