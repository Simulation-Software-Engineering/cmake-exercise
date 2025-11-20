FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

# Install build tools and cmake
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    ca-certificates \
    wget \
    bash \
    libboost-all-dev \
    libdeal.ii-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy project files
COPY . /app

# Ensure the build script is executable
RUN chmod +x /app/build_and_run.sh

# Build during image creation so runtime is fast (cache-friendly)
RUN /app/build_and_run.sh

# Default command: run the built binary with the example config
CMD ["/app/build/main", "/app/yamlParser/config.yml"]
