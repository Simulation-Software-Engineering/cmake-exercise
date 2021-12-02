#!/usr/bin/env bash

if [[ $# = 0 ]]; then
    echo $1
    mkdir -p build && cd build
    cmake -Dyaml-cpp_DIR="${HOME}/software/yaml-cpp/0.7.0/share/cmake/yaml-cpp" /mnt/cmake-exercise
else
    echo $1
    cmake -Dyaml-cpp_DIR="${HOME}/software/yaml-cpp/0.7.0/share/cmake/yaml-cpp" $1
fi
make -j