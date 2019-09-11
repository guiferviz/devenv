
# Let's start with a very basic image from ubuntu.
FROM ubuntu

# We need next line to fech all the repository data
# in order to install packages with apt-get.
RUN apt-get update


#########################
# Define env variables. #
#########################

# Create an environment variable that contains the username.
ENV DOCKER_USER guiferviz
ENV WORKDIR /home/$DOCKER_USER/workspace


#########################
# Create non-root user. #
#########################

# Install the sudo command.
RUN apt-get install -y sudo

# Create an user without password.
RUN adduser --disabled-password --gecos '' "$DOCKER_USER"

# Give root priviledges.
RUN adduser "$DOCKER_USER" sudo

# Give passwordless sudo. This is only acceptable as it is a private
# development environment not exposed to the outside world.
# Do NOT do this on your host machine or otherwise.
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set the user to be our newly created user by default.
# After this all the RUN commands will be executed under this user, so we
# need to use sudo in order to install packages.
USER "$DOCKER_USER"

# This will determine where we will start when we enter the container.
RUN mkdir -p $WORKDIR
WORKDIR $WORKDIR


#####################
# Install programs. #
#####################

# Install tree to show a tree of a directory.
RUN sudo apt-get install -y tree

# Install Git as a main control version system.
RUN sudo apt-get install -y git

# Install make to build things.
RUN sudo apt-get install -y make

# Install curl.
RUN sudo apt-get install -y curl

# Install Neovim as defaul editor.
RUN sudo apt-get install -y neovim
# Create needed config directories.
RUN mkdir -p /home/$DOCKER_USER/.config/nvim/pluggins
# Copy settings file.
COPY ./init.vim /home/$DOCKER_USER/.config/nvim/init.vim
# Also install a plugin manager: vim-plug.
RUN curl -fLo /home/$DOCKER_USER/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install all the plugins.
RUN nvim +PlugInstall +qall

# Install latex.
#RUN sudo apt-get install -y texlive texlive-binaries texlive-fonts-recommended \
#    texlive-generic-recommended texlive-latex-base texlive-latex-extra \
#    texlive-latex-recommended texlive-pictures
#RUN sudo apt-get install -y texlive-lang-japanese
#RUN sudo apt-get install -y texlive-lang-spanish
#RUN sudo apt-get install -y texlive-lang-english

