FROM ubuntu:24.04
WORKDIR /usr/local/app

COPY main.cpp ./

RUN apt-get update && apt-get install -y gcc g++
RUN g++ main.cpp -o main
