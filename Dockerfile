FROM ubuntu:24.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install standard packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    vim \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

# Install Boost libraries (includes Container and Filesystem)
RUN apt-get update && apt-get install -y \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

# Install deal.II
RUN apt-get update && apt-get install -y \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

# Build and install yaml-cpp v0.6.3 from GitHub
# Download and extract - the extracted directory name depends on the tag format
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz -O yaml-cpp.tar.gz && \
    tar -xzf yaml-cpp.tar.gz && \
    YAML_DIR=$(ls -d yaml-cpp-*) && \
    cd $YAML_DIR && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    cd / && \
    rm -rf yaml-cpp.tar.gz $YAML_DIR

# Set LD_LIBRARY_PATH to find libraries in /usr/local/lib
ENV LD_LIBRARY_PATH=/usr/local/lib

# Set working directory - code will be mounted here
WORKDIR /cmake-exercise

