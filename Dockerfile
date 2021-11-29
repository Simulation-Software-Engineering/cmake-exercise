# How to set up:
# vim Dockerfile
# docker build -t <image_name> . 
# docker run -it --name <container_name> <image_name>

FROM ubuntu:20.04 
SHELL ["/bin/bash", "-c"]

# Clone Respository from github
RUN apt update -y
RUN apt install -y git
RUN git clone https://github.com/constracktor/cmake-exercise.git

# Define work directory
WORKDIR /cmake-exercise

# Prevent image from asking time-zone
RUN chmod +x inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# Install required software
RUN apt update -y
RUN apt install -y cmake build-essential libdeal.ii-dev
RUN apt-get update -y
RUN apt-get install -y libboost-all-dev

# Run programm
RUN mkdir build && cd build && cmake .. && make && ./cmake_exercise
