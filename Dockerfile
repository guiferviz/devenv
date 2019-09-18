
# Let's start with a very basic image from ubuntu.
FROM nvidia/cuda

# We need next line to fech all the repository data
# in order to install packages with apt-get.
RUN apt-get update


#########################
# Define env variables. #
#########################

# Define environment variables.
ENV WORKDIR /workspace


#####################
# Install programs. #
#####################

# Install tree to show a tree of a directory.
RUN apt-get install -y tree

# Install Git as a main control version system.
RUN apt-get install -y git
COPY .gitconfig /root

# Install make to build things.
RUN apt-get install -y make

# Install curl.
RUN apt-get install -y curl

# Install python.
# Python is a dependence for neovim, so it should be already installed.
# Let's install pip.
RUN apt-get install -y python3-pip
RUN python3 -m pip install --upgrade pip
# And venv.
RUN apt-get install -y python3-venv
# Create venv.
RUN python3 -m venv /root/venv
COPY requirements.txt /root/venv/requirements.txt
RUN . ~/venv/bin/activate && pip install -r ~/venv/requirements.txt
RUN . ~/venv/bin/activate && jupyter contrib nbextension install --user
RUN . ~/venv/bin/activate && jupyter nbextension enable codefolding/main \
    && jupyter nbextension enable execute_time/ExecuteTime

# Install Neovim as defaul editor.
RUN apt-get install -y neovim
# Create needed config directories.
RUN mkdir -p /root/.config/nvim/pluggins
# Copy settings file.
COPY init.vim /root/.config/nvim/init.vim
# Also install a plugin manager: vim-plug.
RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install all the plugins.
RUN nvim +PlugInstall +qall

# Install tmux, a terminal multiplexer.
RUN apt-get install -y tmux
# Copy configuration file.
COPY .tmux.conf /root/.tmux.conf

# Allow copy and paste between vim and the host computer.
# Some configuration is needed when running the image.
RUN apt-get install -y xclip

# Install latex.
#RUN apt-get install -y texlive texlive-binaries texlive-fonts-recommended \
#  texlive-generic-recommended texlive-latex-base texlive-latex-extra \
#  texlive-latex-recommended texlive-pictures
#RUN apt-get install -y texlive-lang-japanese
#RUN apt-get install -y texlive-lang-spanish
#RUN apt-get install -y texlive-lang-english


################
# Final setup. #
################

# Copy .bashrc file.
COPY .bashrc /root/.bashrc

# Set default working directory.
WORKDIR $WORKDIR

