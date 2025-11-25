FROM ubuntu:24.04

# Install dependencies
RUN rm -rf /var/lib/apt/lists/* \
    && apt-get update --fix-missing \
    && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        wget \
        unzip \
        vim \
        libboost-all-dev \
        libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

# Build and install yaml-cpp v0.6.3 from source
RUN wget --no-check-certificate https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    && tar -xzf yaml-cpp-0.6.3.tar.gz \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && make install \
    && cd ../.. \
    && rm -rf yaml-cpp-yaml-cpp-0.6.3 yaml-cpp-0.6.3.tar.gz


# Set LD_LIBRARY_PATH to include /usr/local/lib for yaml-cpp
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

WORKDIR /workdir

CMD ["/bin/bash"]
