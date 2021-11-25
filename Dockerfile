FROM ubuntu:20.04

# set up shell + timezone stuff
SHELL ["/bin/bash", "-c"]
COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# cmake + git + libraries

RUN apt-get -y update
RUN apt-get -y install build-essential cmake git wget nano libboost-all-dev libdeal.ii-dev

# manual installation of yaml-cpp, using compile script

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.7.0.tar.gz
RUN tar xfz yaml-cpp-0.7.0.tar.gz

COPY compile_yaml-cpp.sh /usr/local/bin/compile_yaml-cpp.sh
RUN chmod +x /usr/local/bin/compile_yaml-cpp.sh
RUN /usr/local/bin/compile_yaml-cpp.sh

# clone and compile

RUN git clone https://github.com/qwach/cmake-exercise.git

COPY compile_exercise.sh /usr/local/bin/compile_exercise.sh
RUN chmod +x /usr/local/bin/compile_exercise.sh
RUN /usr/local/bin/compile_exercise.sh

# little test
RUN cd cmake-exercise/build && ./cmake-geldnens


# cleanup
RUN rm yaml-cpp-0.7.0.tar.gz
RUN rm -rf yaml-cpp-yaml-cpp-0.7.0

