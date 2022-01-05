FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]

COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

COPY fem /home/cmake-exercise/fem
COPY filesystem /home/cmake-exercise/filesystem
COPY flatset /home/cmake-exercise/flatset
COPY yamlParser /home/cmake-exercise/yamlParser
COPY main.cpp /home/cmake-exercise/
COPY CMakeLists.txt /home/cmake-exercise/

RUN \
  apt-get update && \
  apt-get -y install git && \
  apt-get -y install build-essential && \
  apt-get -y install cmake && \
  apt-get -y install vim && \
  apt-get -y install wget  && \
  apt-get -y install software-properties-common && \
  add-apt-repository ppa:ginggs/deal.ii-9.3.0-backports && \
  apt-get update && \
  apt-get -y install libboost-all-dev && \
  apt-get -y install libdeal.ii-dev && \
  apt-get -y install libopenmpi-dev
#  cd /home/cmake-exercise/ && \
#  wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.7.0.tar.gz && \
#  tar -zxvf yaml-cpp-0.7.0.tar.gz && \

