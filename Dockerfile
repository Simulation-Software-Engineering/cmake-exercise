FROM ubuntu:18.04

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt-get update
RUN apt-get install -y  

ENTRYPOINT ["/bin/bash"]

RUN apt-get install -y git
RUN cd home
RUN git clone https://github.com/EvanA93/cmake-exercise.git
WORKDIR /cmake-exercise
RUN apt-get install -y build-essential
RUN apt-get install -y cmake
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libdeal.ii-dev
RUN mkdir CMakeExercise_build
RUN cd CMakeExercise_build
RUN cmake ..
RUN cmake --build .
RUN ./CMakeExercise


