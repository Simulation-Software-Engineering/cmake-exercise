
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    wget \
    unzip \
    vim \
    ca-certificates \
    libboost-all-dev \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*


# download and build yaml-cpp 0.6.3 from source
RUN wget -q \
    https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    -O /tmp/yaml-cpp.tar.gz \
    && mkdir -p /tmp/yaml-cpp-src \
    && tar -xzf /tmp/yaml-cpp.tar.gz \
       -C /tmp/yaml-cpp-src --strip-components=1 \
    && cmake -S /tmp/yaml-cpp-src -B /tmp/yaml-cpp-build \
       -DYAML_CPP_BUILD_TESTS=OFF \
       -DYAML_CPP_BUILD_TOOLS=OFF \
    && cmake --build /tmp/yaml-cpp-build -j 2 \
    && cmake --install /tmp/yaml-cpp-build \
    && ldconfig

ENV LD_LIBRARY_PATH=/usr/local/lib

WORKDIR /cmake-exercise

COPY . /cmake-exercise

#fix Windows CRLF line endings
RUN sed -i 's/\r$//' build_and_run.sh

CMD ["/bin/bash"]