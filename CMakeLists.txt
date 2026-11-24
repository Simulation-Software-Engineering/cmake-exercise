cmake_minimum_required(VERSION 3.16)

find_package(deal.II 9.5 REQUIRED)
deal_ii_initialize_cached_variables()

project(cmake-exercise LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(yaml-cpp REQUIRED)

add_executable(main
  main.cpp
  flatset/flatset.cpp
  filesystem/filesystem.cpp
  fem/fem.cpp
  yamlParser/yamlParser.cpp
)

target_include_directories(main PRIVATE ${CMAKE_SOURCE_DIR})
deal_ii_setup_target(main)
target_link_libraries(main Boost::filesystem yaml-cpp)
