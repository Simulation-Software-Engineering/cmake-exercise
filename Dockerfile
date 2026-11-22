FROM ubuntu:24.04

RUN apt-get update -y && apt-get install -y build-essential \
    cmake unzip wget vim libboost-all-dev libdeal.ii-dev

COPY  . /cmake-exercise/

CMD [ "/bin/bash" ]


