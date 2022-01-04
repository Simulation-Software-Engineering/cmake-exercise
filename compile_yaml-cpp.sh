#!/bin/bash
# Compile commands for yaml-cpp

cd yaml-cpp-yaml-cpp-0.7.0
mkdir build && cd build
cmake -YAML_BUILD_SHARED_LIBS=ON .. 
make && make install
