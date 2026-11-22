FROM ubuntu:24.04

RUN apt-get update -y && apt-get install -y build-essential \
    cmake unzip wget vim libboost-all-dev

COPY  . /cmake-exercise/

CMD [ "/bin/bash" ]


