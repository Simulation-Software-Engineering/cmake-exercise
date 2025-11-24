cmake_minimum_required(VERSION 3.24)

project("CMakeFight Exercise")

find_package(Boost REQUIRED COMPONENTS filesystem)

find_package(deal.II REQUIRED)

find_package(yaml-cpp REQUIRED)

find_package(deal.II 9.0 REQUIRED CONFIG
  HINTS ${DEAL_II_DIR} $ENV{DEAL_II_DIR}
)
add_executable(
  main
  main.cpp
  fem/fem.cpp
  flatset/flatset.cpp
  filesystem/filesystem.cpp
  yamlParser/yamlParser.cpp
)

target_link_libraries(main Boost::filesystem)

DEAL_II_SETUP_TARGET(main)

target_link_libraries(main yaml-cpp)