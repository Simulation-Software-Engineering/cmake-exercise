# Use the official deal.II image which already provides MPI and deal.II
FROM ubuntu:24.04

# Install development tools, MPI, CMake and (if available) packaged deal.II
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
	 build-essential \
	 cmake \
	 vim \
     wget \
     g++ \
     libstdc++-12-dev \
	 libboost-all-dev \
     libdeal.ii-dev \
&& rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz && \
    tar -xzf yaml-cpp-0.6.3.tar.gz && \
    cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && cd build && \
    cmake .. && make && make install && \
    cd ../.. && rm -rf yaml-cpp-*

WORKDIR /mnt/hst

# Copy project sources into container
COPY . /mnt/hst

# Default command: run the compiled binary with the YAML config
CMD ["./build_and_run.sh"]
