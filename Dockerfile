FROM ubuntu:24.04

RUN apt-get update && apt-get install -y build-essential cmake unzip wget vim libdeal.ii-dev libopenmpi-dev libkokkos-dev libboost-all-dev

