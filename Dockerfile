FROM ubuntu:24.04

# Dependencies
RUN apt-get update
RUN apt install -y build-essential
RUN apt install -y cmake
RUN apt install -y unzip
RUN apt install -y wget
RUN apt install -y vim
RUN apt install -y libboost-all-dev
Run apt install -y libdeal.ii-dev

# Yaml
Run wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip
Run unzip yaml-cpp-0.6.3.zip
RUN cd yaml-cpp-yaml-cpp-0.6.3 && mkdir build && cd build && cmake .. && make && make install
ENV LD_LIBRARY_PATH = /usr/local/bin

WORKDIR mnt/host

# Execute default command
#CMD ["/bin/bash"]