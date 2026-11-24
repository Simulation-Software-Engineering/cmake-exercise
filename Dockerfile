FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    ca-certificates \
    wget \
    tar \
    unzip \
    vim \
    libboost-all-dev \
    libdeal.ii-dev \
    libyaml-cpp-dev \
    && rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}"

# Copy repository into the container
COPY . /cmake-exercise

RUN chmod +x /cmake-exercise/build_and_run.sh

# Start outside the repository
WORKDIR /

CMD ["/bin/bash"]


