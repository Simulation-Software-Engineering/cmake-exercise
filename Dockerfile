FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH=/usr/local/lib

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        cmake \
        libboost-all-dev \
        libdeal.ii-dev \
        wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/yaml-cpp-0.6.3.tar.gz \
        https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    && mkdir -p /tmp/yaml-cpp \
    && tar -xzf /tmp/yaml-cpp-0.6.3.tar.gz --strip-components=1 -C /tmp/yaml-cpp \
    && cmake -S /tmp/yaml-cpp -B /tmp/yaml-cpp/build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/local \
        -DYAML_BUILD_SHARED_LIBS=ON \
    && cmake --build /tmp/yaml-cpp/build --parallel \
    && cmake --install /tmp/yaml-cpp/build \
    && ldconfig \
    && rm -rf /tmp/yaml-cpp /tmp/yaml-cpp-0.6.3.tar.gz

COPY . /cmake-exercise

WORKDIR /

CMD ["bash"]
