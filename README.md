
# My Docker development environment

Commands and configuration files needed for creating a Docker image with my development environment.


# What it contains?

* NeoVim + pluggins. Among the plugins you will find:
    * Airline, a beautiful and useful status bar.
    * NERDTree, a file system browser.
    * Monokai colorscheme, to remember Sublime Text times :)
* Git.
* Make.
* curl.
* Python 3.6 with a prebuild virtual environment for data science.

# Other particularities

* The container will start using a non-sudo user.
You can use sudo when needed to grant superuser access.
No password is needed.
* If you start the container using `run_devenv.sh` your `~/.ssh` folder will be mounted on the container.
* Also, the current directory will be mounted in `~/workspace`.
That folder will be the default folder when the container starts.


# Thanks to...

This repository has been inspired in:
https://github.com/AGhost-7/docker-dev/
The amazing guy AGhost-7 has a tutorial in which he teach how to build your personalized image.

