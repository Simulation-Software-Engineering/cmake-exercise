FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Build tools and the dependencies available as Ubuntu packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        cmake \
        unzip \
        vim \
        wget \
        libboost-all-dev \
        libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

# yaml-cpp has to be exactly version 0.6.3, built from the GitHub release sources
WORKDIR /tmp
RUN wget -q https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    && tar -xzf yaml-cpp-0.6.3.tar.gz \
    && cmake -S yaml-cpp-yaml-cpp-0.6.3 -B yaml-cpp-build \
        -DCMAKE_BUILD_TYPE=Release \
        -DYAML_BUILD_SHARED_LIBS=ON \
        -DYAML_CPP_BUILD_TESTS=OFF \
        -DYAML_CPP_BUILD_TOOLS=OFF \
    && make -C yaml-cpp-build -j"$(nproc)" \
    && make -C yaml-cpp-build install \
    && rm -rf /tmp/yaml-cpp-0.6.3.tar.gz /tmp/yaml-cpp-yaml-cpp-0.6.3 /tmp/yaml-cpp-build

# yaml-cpp is installed to /usr/local/lib
ENV LD_LIBRARY_PATH=/usr/local/lib

WORKDIR /root
COPY . cmake-exercise

CMD ["/bin/bash"]
