
# Let's start with a basic image with the NVIDIA drivers installed.
FROM nvidia/cuda


#########################
# Define env variables. #
#########################

# Define environment variables.
ENV WORKDIR /workspace


#####################
# Install programs. #
#####################

# We need next line to fech all the repository data
# in order to install packages with apt-get.
RUN apt-get update

# Install Python 3.
RUN apt-get install -y python3
# Let's install and upgrade pip.
RUN apt-get install -y python3-pip
RUN python3 -m pip install --upgrade pip
# Create venv.
COPY requirements.txt /root/venv/requirements.txt
RUN pip install -r ~/venv/requirements.txt
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable codefolding/main \
    && jupyter nbextension enable execute_time/ExecuteTime


#########
# Setup #
#########

# Set default working directory.
WORKDIR $WORKDIR

# Convenience aliases.
COPY notebook /usr/bin
RUN chmod +x /usr/bin/notebook

