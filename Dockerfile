FROM ubuntu:24.04

RUN apt-get update && apt-get install -y build-essential cmake libboost-filesystem-dev unzip wget vim libdeal.ii-dev

COPY CMakeLists.txt main.cpp /app/
COPY /filesystem /app/filesystem
COPY flatset /app/flatset
COPY fem /app/fem
COPY yamlParser /app/yamlParser

RUN set -eux; \
    wget -O /tmp/yaml-cpp-0.6.3.tar.gz \
      https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz; \
    mkdir -p /tmp/yaml-cpp-src; \
    tar -xzf /tmp/yaml-cpp-0.6.3.tar.gz \
      --strip-components=1 -C /tmp/yaml-cpp-src; \
    cmake -S /tmp/yaml-cpp-src -B /tmp/yaml-cpp-build \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DYAML_CPP_BUILD_TESTS=OFF \
      -DYAML_CPP_BUILD_TOOLS=OFF; \
    cmake --build /tmp/yaml-cpp-build --parallel; \
    cmake --install /tmp/yaml-cpp-build; \
    rm -rf /tmp/yaml-cpp-src /tmp/yaml-cpp-build /tmp/yaml-cpp-0.6.3.tar.gz

WORKDIR /app
RUN cmake -S . -B build && cmake --build build