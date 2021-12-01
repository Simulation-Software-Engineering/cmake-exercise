FROM ubuntu:20.04

WORKDIR /cmake_exercise

COPY inittimezone /usr/local/bin/inittimezone
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get -y install build-essential cmake git-all wget


RUN git clone https://github.com/Ovakefali13/cmake-exercise.git
RUN apt-get install -y libboost-all-dev libdeal.ii-dev



RUN cd cmake-exercise && mkdir build && cd build && cmake .. && make

CMD ["/bin/bash"]