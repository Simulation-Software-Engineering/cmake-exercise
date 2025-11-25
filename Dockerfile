FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    # Packages recommended by the exercise:
    build-essential cmake unzip wget vim \
    # Boost filesystem:
    libboost-all-dev \
    # deal.II:
    libdeal.ii-dev

# yaml-cpp from apt:
# RUN apt-get update && apt-get install -y libyaml-cpp-dev

# yaml-cpp from source:
RUN mkdir yaml-cpp && cd yaml-cpp && \
    wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz && \
    tar --extract -f yaml-cpp-0.6.3.tar.gz && \
    cd yaml-cpp-yaml-cpp-0.6.3 && mkdir build && cd build && \
    cmake -DYAML_BUILD_SHARED_LIBS=ON .. && make && make install && \
    cd ../../.. && rm -rf yaml-cpp

WORKDIR /mnt/host/
