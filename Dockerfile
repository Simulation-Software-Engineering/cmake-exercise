FROM ubuntu:24.04

RUN apt-get update -y 

WORKDIR /usr/app

# Install necessary tools and libraries for building
RUN apt-get install -y build-essential cmake wget
RUN apt-get install -y libboost-all-dev libdeal.ii-dev

# Build yaml-cpp 0.6.3 from source
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz
RUN tar -xzf yaml-cpp-0.6.3.tar.gz && rm yaml-cpp-0.6.3.tar.gz
WORKDIR /usr/app/yaml-cpp-yaml-cpp-0.6.3
RUN mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DYAML_BUILD_SHARED_LIBS=on .. && \
    cmake --build . && \
    make install

ENV LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}

WORKDIR /mnt/host
