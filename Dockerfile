FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    vim \
    libboost-all-dev \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

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

WORKDIR /cmake-exercise

COPY . .

CMD ["/bin/bash"]