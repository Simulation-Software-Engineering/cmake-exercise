FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential cmake unzip wget vim ca-certificates \
    libboost-all-dev libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    && tar -xzf yaml-cpp-0.6.3.tar.gz \
    && cmake -S yaml-cpp-yaml-cpp-0.6.3 -B yaml-build \
       -DYAML_CPP_BUILD_TESTS=OFF \
       -DYAML_CPP_BUILD_TOOLS=OFF \
    && cmake --build yaml-build -j"$(nproc)" \
    && cmake --install yaml-build \
    && ldconfig \
    && rm -rf yaml-cpp-0.6.3.tar.gz yaml-cpp-yaml-cpp-0.6.3 yaml-build

ENV LD_LIBRARY_PATH=/usr/local/lib

COPY . /cmake-exercise
WORKDIR /
CMD ["/bin/bash"]
