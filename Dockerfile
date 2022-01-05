FROM ubuntu:20.04

# Clone files from github
RUN apt update -y
RUN apt install -y git
RUN git clone https://github.com/mohamad-altaweel/cmake-exercise.git

# set work dir
WORKDIR /cmake-exercise

# run inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# install packages
RUN apt-get -y install build-essential cmake vim libboost-all-dev libdeal.ii-dev libopenmpi-dev

# create build folder and execute cmake
COPY CMakeLists.txt /cmake-exercise
RUN mkdir build \
&& cd build \
&& cmake .. \
&& make