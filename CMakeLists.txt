cmake_minimum_required(VERSION 3.16)

project(cmake-exercise LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II 9.4.0 REQUIRED)
find_package(yaml-cpp 0.6.3 EXACT REQUIRED)

add_executable(main
  main.cpp
  fem/fem.cpp
  flatset/flatset.cpp
  filesystem/filesystem.cpp
  yamlParser/yamlParser.cpp
)

target_link_libraries(main Boost::filesystem yaml-cpp)

deal_ii_setup_target(main)
