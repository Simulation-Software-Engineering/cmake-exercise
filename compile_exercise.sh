#!/bin/bash
# Compile commands for exercise

cd cmake-exercise
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE="Release" .. # for Deal.II
make
cd ../..
