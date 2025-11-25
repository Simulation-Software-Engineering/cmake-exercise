FROM ubuntu:24.04

# 1. Install standard build tools and library dependencies available in repo
# - build-essential: gcc/g++ and make
# - cmake: build system
# - wget/unzip: to fetch yaml-cpp
# - libboost-all-dev: Boost Container and Filesystem
# - libdeal.ii-dev: The FEM library
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    vim \
    libboost-all-dev \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. The "Bonus" Task: Build yaml-cpp v0.6.3 from source
WORKDIR /tmp
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip -O yaml-cpp.zip \
    && unzip yaml-cpp.zip \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && mkdir build \
    && cd build \
    && cmake -DYAML_BUILD_SHARED_LIBS=ON .. \
    && make -j$(nproc) \
    && make install \
    && cd /tmp \
    && rm -rf yaml-cpp*

# 3. Set Environment Variable
# CMake usually installs to /usr/local/lib. We need to tell the OS to look there.
# ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
  ENV LD_LIBRARY_PATH=/usr/local/lib

# 4. Setup working directory for the user
WORKDIR /root/cmake-exercise

# Default command (optional, but good for interactive mode)
CMD ["bash"]