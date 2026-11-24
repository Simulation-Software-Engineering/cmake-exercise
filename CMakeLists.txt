cmake_minimum_required(VERSION 3.15)

project("cmake-exercise")

find_package(Boost CONFIG REQUIRED)

add_executable(main main.cpp flatset/flatset.cpp)

target_link_libraries(main Boost::headers)