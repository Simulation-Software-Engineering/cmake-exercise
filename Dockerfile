FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    libboost-all-dev \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

# Download yaml-cpp v0.6.3 from GitHub
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    -O yaml-cpp.tar.gz \
    && tar -xzf yaml-cpp.tar.gz \
    && mv yaml-cpp-yaml-cpp-0.6.3 yaml-cpp

# Build yaml-cpp
WORKDIR /tmp/yaml-cpp/build

# Install yaml-cpp
RUN cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DYAML_BUILD_SHARED_LIBS=ON \
    && make -j$(nproc) \
    && make install \
    && ldconfig

# Make installed libraries and CMake packages discoverable
ENV LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}
ENV CMAKE_PREFIX_PATH=/usr/local:${CMAKE_PREFIX_PATH}

WORKDIR /cmake-exercise

COPY . /cmake-exercise

CMD ["/bin/bash"]