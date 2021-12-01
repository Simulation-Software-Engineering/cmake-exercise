FROM ubuntu:20.04

# Set timezone
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install packages
RUN apt update -y
RUN apt install -y libboost-all-dev cmake build-essential libdeal.ii-dev git vim

# Clone repo/copy files
# RUN git clone https://github.com/jonahaag/cmake-exercise
RUN mkdir cmake-exercise
COPY fem cmake-exercise/fem
COPY filesystem cmake-exercise/filesystem
COPY flatset cmake-exercise/flatset
COPY main.cpp cmake-exercise/main.cpp
COPY CMakeLists.txt cmake-exercise/CMakeLists.txt

# Create folders and run cmake
RUN cd cmake-exercise && mkdir build && cd build && cmake .. && make && ./main

CMD ["/bin/bash"]
