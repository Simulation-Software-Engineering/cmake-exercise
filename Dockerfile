FROM ubuntu:20.04

WORKDIR /var/src/ex

# Set timezone to Berlin
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# Install necessary libraries and packages
RUN apt-get update \
    && apt-get install -y \
    build-essential \
    cmake \
    libboost-container-dev \
    libboost-filesystem-dev \
    libopenmpi-dev \
    libdeal.ii-dev \
    wget

# Install newer yaml-cpp
COPY install-yaml-cpp /usr/local/bin/install-yaml-cpp
RUN install-yaml-cpp
