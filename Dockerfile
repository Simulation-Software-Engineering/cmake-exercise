FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    vim \
    libboost-all-dev \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip \
    && unzip yaml-cpp-0.6.3.zip \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && cmake -S . -B build -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DYAML_CPP_BUILD_TESTS=OFF \
    && cmake --build build -j2 \
    && cmake --install build

COPY CMakeLists.txt main.cpp build_and_run.sh /cmake-exercise/

COPY fem/ /cmake-exercise/fem/
COPY filesystem/ /cmake-exercise/filesystem/
COPY flatset/ /cmake-exercise/flatset/
COPY yamlParser/ /cmake-exercise/yamlParser/

WORKDIR /
CMD ["/bin/bash"]