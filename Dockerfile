FROM ubuntu:20.04

WORKDIR /var/src/ex

COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    cmake \
    libboost-container-dev \
    libboost-filesystem-dev \
    libopenmpi-dev \
    libdeal.ii-dev \
    wget

COPY install-yaml-cpp /usr/local/bin/install-yaml-cpp
RUN install-yaml-cpp
