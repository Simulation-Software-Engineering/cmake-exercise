FROM ubuntu:24.04

RUN apt update -y && apt install -y build-essential cmake unzip wget vim libboost-all-dev libdeal.ii-dev
WORKDIR /app
COPY . .
WORKDIR /tmp
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz && tar -xzf yaml-cpp-0.6.3.tar.gz
WORKDIR /tmp/yaml-cpp-yaml-cpp-0.6.3
RUN mkdir build
WORKDIR /tmp/yaml-cpp-yaml-cpp-0.6.3/build
RUN cmake ..
RUN make install
WORKDIR /app
CMD ["/bin/bash"]