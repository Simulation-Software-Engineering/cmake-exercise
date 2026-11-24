FROM ubuntu:24.04

RUN apt-get update && apt-get install -y build-essential cmake libboost-all-dev

COPY . /cmake-exercise

CMD ["/bin/bash"]