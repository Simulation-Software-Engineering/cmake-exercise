FROM ubuntu:24.04

RUN apt-get update && apt-get install -y build-essential cmake 

COPY . /cmake-exercise

CMD ["/bin/bash"]