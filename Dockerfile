FROM ubuntu:20.04

WORKDIR /cmake_exercise

COPY inittimezone /usr/local/bin/inittimezone
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN chmod 777 /usr/local/bin/inittimezone && apt update && apt-get -y install build-essential && apt-get -y install cmake && apt install -y git-all && apt-get -y install wget

RUN git clone https://github.com/Ovakefali13/cmake-exercise.git

RUN cd cmake-exercise && mkdir build && cd build && cmake .. && make

CMD ["/bin/bash"]