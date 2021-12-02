#!/bin/bash
FROM ubuntu:20.04

# Copy files to Docker container
RUN mkdir cmake-exercise
COPY cmake-ex/ /cmake-exercise/

CMD ["/bin/bash"]

# Set timezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# Install software packages
RUN apt update && apt install -y g++ && apt install -y build-essential && apt install -y cmake && apt install -y git && apt install -y wget && apt install -y vim && apt install -y libboost-all-dev && apt install -y libdeal.ii-dev && apt install -y libopenmpi-dev

RUN git clone https://github.com/jbeder/yaml-cpp && cd yaml-cpp && mkdir build && cd build && cmake -YAML_BUILD_SHARED_LIBRARY=ON .. && make install

# delete source files if necessary
# RUN rm -rf yaml-cpp

# Set working directory
WORKDIR /cmake-exercise

# Build the executable
RUN mkdir build && cd build && cd .. && rm -r build/ && mkdir build && cd build && cmake .. && make

