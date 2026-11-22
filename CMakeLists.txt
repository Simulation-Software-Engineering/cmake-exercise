cmake_minimum_required(VERSION "3.12")

project("cmake-docker")

find_package(Boost 1.67.0 REQUIRED)

add_executable(main main.cpp flatset/flatset.cpp)