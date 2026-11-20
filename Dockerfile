FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    vim \
    libboost-container-dev \
    libboost-filesystem-dev \
    libdeal.ii-dev && \
    wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip && \
    unzip yaml-cpp-0.6.3.zip && \
    cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

WORKDIR /app

COPY . .

CMD ["/bin/bash"]
