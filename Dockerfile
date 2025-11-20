FROM ubuntu:24.04

# Install basic build tools
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Install Boost libraries
RUN apt-get update && apt-get install -y \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

# Install deal.II
RUN apt-get update && apt-get install -y \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

# Install yaml-cpp
WORKDIR /tmp
RUN wget https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.6.3.tar.gz && \
    tar -xzf yaml-cpp-0.6.3.tar.gz && \
    cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && cd build && \
    cmake -DYAML_BUILD_SHARED_LIBS=ON .. && \
    make -j$(nproc) && \
    make install && \
    ldconfig && \
    cd / && \
    rm -rf /tmp/yaml-cpp-*

# Set LD_LIBRARY_PATH for libraries in /usr/local/lib
ENV LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}

# Set working directory
WORKDIR /cmake-exercise

# Copy project files
COPY . /cmake-exercise/

