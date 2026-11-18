FROM ubuntu:24.04

RUN apt update && \
    apt install -y build-essential cmake wget unzip libboost-all-dev libdeal.ii-dev

WORKDIR /src

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip && \
    unzip yaml-cpp-0.6.3.zip && \
    rm yaml-cpp-0.6.3.zip
RUN cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make install

COPY . cmake-exercise

CMD ["/bin/bash"]
