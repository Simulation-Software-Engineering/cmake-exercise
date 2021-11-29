FROM ubuntu:20.04

# set working directory
ADD . /cmake-exercise
WORKDIR /cmake-exercise

# include time zone info
RUN chmod +x inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# install packages
RUN apt -y update && apt install -y build-essential && apt install -y cmake && apt install -y git && apt install -y vim && apt install -y libboost-all-dev && apt install -y libdeal.ii-dev

# run code
