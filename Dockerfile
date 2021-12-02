FROM ubuntu:20.04

# or we could just clone 
ADD . /cmake-exercise
WORKDIR /cmake-exercise

# script for timezone
RUN chmod +x inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# install necessary packages
RUN apt-get update && apt-get install -y \
            build-essential \
            cmake \ 
            git \
            wget \
            vim \
            libboost-all-dev \
            libdeal.ii-dev


# cmake commands for building binaries
RUN mkdir build && cd build && cmake ..
RUN make install
RUN ./cmake-exercise
