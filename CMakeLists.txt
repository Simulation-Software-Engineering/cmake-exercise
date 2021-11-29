cmake_minimum_required(VERSION "3.0")

project("brenchla-cmake-exercise")

find_package(Boost)
find_package(deal.II)



add_executable(${PROJECT_NAME} main.cpp
    flatset/flatset.cpp 
    filesystem/filesystem.cpp 
)
