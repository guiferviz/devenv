
# Base image.
FROM ubuntu:19.10

# Docker build variables definitions.
ARG WORKDIR=/workspace

# Update repo info.
RUN apt-get update

# Install tzdata first because it is a dependency of the texlive packages and
# it ask for some configuration while installing. To avoid that interactivity
# I install it first with a environment variable set to no interactive.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

# Install latex packages.
RUN apt-get install -y \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-latex-extra

# Install graphviz for graphs creation.
RUN apt-get install -y graphviz

# Graphviz to Latex graphs.
RUN apt-get install -y dot2tex
#RUN pip3 install dot2tex

# Image converter/editor.
RUN apt-get install -y imagemagick
# Change the policy so you can generate PDFs with pdflatex.
RUN sed -i 's/rights="none" pattern="PDF"/rights="read|write" pattern="PDF"/g' /etc/ImageMagick-6/policy.xml

# Make for building my stuff.
RUN apt-get install -y make

# Set working directory.
WORKDIR $WORKDIR

