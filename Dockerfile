FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

# set working directory
ADD . /cmake-exercise
WORKDIR /cmake-exercise

# include time zone info
RUN chmod +x inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# install packages
RUN apt -y update
RUN apt install -y build-essential cmake git vim libboost-all-dev libdeal.ii-dev libopenmpi-dev

# install yaml-cpp
RUN git clone https://github.com/jbeder/yaml-cpp \
&& cd yaml-cpp \
&& mkdir build \
&& cd build \
&& cmake -YAML_BUILD_SHARED_LIBRARY=ON .. \
&& make \
&& make install
# clean up after installation
RUN rm -rf yaml-cpp

# create build directory and make executable
RUN mkdir build \
&& cd build \
&& cmake .. \
&& make

