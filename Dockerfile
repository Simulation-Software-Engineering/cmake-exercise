FROM ubuntu:24.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Base tools and dev packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    vim \
    git \
    libboost-all-dev \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

# Build and install yaml-cpp v0.6.3 from source
WORKDIR /tmp
RUN wget --no-check-certificate https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    && tar -xzf yaml-cpp-0.6.3.tar.gz \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DYAML_BUILD_TESTS=OFF .. \
    && make -j"$(nproc)" \
    && make install \
    && cd /tmp \
    && rm -rf yaml-cpp-*

# Make sure libraries in /usr/local/lib (yaml-cpp) are found
ENV LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH:-}

# Workdir for the project
WORKDIR /workspace

# Copy the repository contents
COPY . /workspace/cmake-exercise

# Switch into the exercise folder by default
WORKDIR /workspace/cmake-exercise

# Default command: drop into a shell
CMD ["/bin/bash"]
