FROM ubuntu:24.04

RUN apt-get update && apt-get install -y build-essential cmake libboost-all-dev libdeal.ii-dev wget

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    && tar -xzf yaml-cpp-0.6.3.tar.gz \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make -j$(nproc) \
    && make install

COPY . /cmake-exercise

CMD ["/bin/bash"]