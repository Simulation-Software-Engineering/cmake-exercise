cmake_minimum_required(VERSION "3.12")

project("cmake-docker")

find_package(Boost 1.67.0 REQUIRED COMPONENTS filesystem)

add_executable(main main.cpp flatset/flatset.cpp filesystem/filesystem.cpp)

target_link_libraries(main PRIVATE Boost::filesystem)