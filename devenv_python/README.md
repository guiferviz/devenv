
# My Python development environment

Docker image with the packages I use the most in my projects.


## Why a Docker image?

Docker allows me to create a new version of the image everytime I want to add new libraries or update the existing ones.

Sometimes, having a *requirements.txt* file is not enough because we don't usually write the versions of the packages in that file.
Although creating a *requirements.txt.lock* with `pip freeze` can be a solution, having a history of images allows me to go back in time and execute old code with exactly the same environment easier than recreating the environments.

Creating a new venv for each project with PyTorch, NumPy... takes a lot of disk space.
Docker is based on layers, so the initial image is shared between all the containers.

Another important requirement of my development environment is to allow the installation of project-specific packages.
With Docker this is not a problem because we can reuse easily the containers (see the section *Install script for easy use of the image* for more information).


# Build

Build image using:

    make


# Publish

There is a public repository in Docker Hub that is connected to the GitHub repository and creates a new build everytime I push a new tag to the git repository.
The tag should follow the format "v<year>.<month>" where year is the last 2 digits of the year and month is the number of the month with leading zeros if month number < 10.
Create a local tag with:

    git tag -a v20.01 -m "January 2020 devenv"

And push the tag with:

    git push origin v20.01


# Install script for easy use of the image

After executing:

    sudo make install

you will have a command `devenv_python` that is going to run a docker container with the python image.

If you run the command without parameters, it's going to read the directory name and is going to create a Docker container with that name.
This script also checks if you have GPU or not, in order to create/start the correct container.
The fist time is executed, the script creates (using `docker run`) an interactive container with the current directory mounted in `/workspace` and using the host network.
If you don't have GPU, the name of that container is *python_<folder_name>* and if you have, the name is *python_gpu_<folder_name>*.

The next times the script is executed in the same folder, it is going to start the already created container.
So you can install whatever you want in a container and you are going to be able to use it again after shutting down the process.


# Extra details

You can start a Jupyter notebook very easy using the `notebook` command that is already included in the image.

