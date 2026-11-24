cmake_minimum_required(VERSION 3.15)

project("cmake-exercise")

find_package(Boost CONFIG REQUIRED COMPONENTS filesystem)

add_executable(main main.cpp flatset/flatset.cpp filesystem/filesystem.cpp)

target_link_libraries(main Boost::headers Boost::filesystem)