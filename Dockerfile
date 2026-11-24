FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    libboost-all-dev \
    libdeal.ii-dev \
    libyaml-cpp-dev

WORKDIR /cmake-exercise

COPY . /cmake-exercise

CMD ["/bin/bash"]