FROM ubuntu:24.04

# Avoid interactive prompts during apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Core build tools and Boost (Container is header-only, Filesystem is linked)
RUN apt-get update \
    && apt-get install -y \
       build-essential \
       cmake \
       unzip \
       wget \
       vim \
       libboost-all-dev \
       libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

# Build and install yaml-cpp v0.6.3 from source (not available in this version via apt)
RUN cd /tmp \
    && wget -q https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip \
    && unzip -q yaml-cpp-0.6.3.zip \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && cmake -DYAML_CPP_BUILD_TESTS=OFF . \
    && make -j"$(nproc)" \
    && make install \
    && rm -rf /tmp/yaml-cpp-0.6.3.zip /tmp/yaml-cpp-yaml-cpp-0.6.3

# Installed yaml-cpp libraries live in /usr/local/lib
ENV LD_LIBRARY_PATH=/usr/local/lib

WORKDIR /root

# Copy the project into the image (copy instead of a mount)
COPY . cmake-exercise

# Normalize possible DOS line endings and make the build script executable
RUN sed -i 's/\r$//' cmake-exercise/build_and_run.sh \
    && chmod +x cmake-exercise/build_and_run.sh
