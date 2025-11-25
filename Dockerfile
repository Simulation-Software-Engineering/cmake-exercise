FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    wget \
    unzip \
    vim \
    git \
    ca-certificates \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Boost libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

# Install deal.II 
RUN apt-get update && apt-get install -y --no-install-recommends \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

# Install yaml-cpp v0.6.3 from source 
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip -O yaml-cpp.zip \
    && unzip yaml-cpp.zip \
    && mv yaml-cpp-yaml-cpp-0.6.3 yaml-cpp

# Build and install yaml-cpp
WORKDIR /tmp/yaml-cpp
RUN mkdir build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && make -j$(nproc) \
    && make install

ENV LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}

WORKDIR /cmake-exercise

COPY . /cmake-exercise

RUN mkdir build && cd build \
    && cmake .. \
    && make -j$(nproc)

CMD ["/bin/bash"]
