FROM ubuntu:20.04

# mount working directory
ADD . /cmake_exercise
WORKDIR /cmake_exercise

# timezone stuff
RUN chmod +x inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# install packages& dependencies
RUN apt-get -y update && apt install -y \
    build-essential \
    cmake \
    git \
    wget \
    vim \
    libboost-all-dev \
    libdeal.ii-dev

# create build directory and make executable
RUN rm -rf build && mkdir build
RUN cd build && cmake .. && make 

