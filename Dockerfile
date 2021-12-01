FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y  

ENTRYPOINT ["/bin/bash"]

RUN apt-get install -y git
RUN git clone https://github.com/EvanA93/cmake-exercise.git

WORKDIR /cmake-exercise

#COPY inittimezone /usr/local/bin/inittimezone
#RUN /usr/local/bin/inittimezone

RUN apt-get install -y build-essential && apt-get install -y cmake && apt-get install -y libboost-all-dev\
&& apt-get install -y libdeal.ii-dev && apt-get install -y libopenmpi-dev

RUN mkdir CMakeExercise_build && cd CMakeExercise_build && cmake .. && cmake --build . && ./CMakeExercise


