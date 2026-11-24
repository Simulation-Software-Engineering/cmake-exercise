cmake_minimum_required(VERSION 3.13.4)

find_package(deal.II 9.5.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)

deal_ii_initialize_cached_variables()

project(cmake_exercise LANGUAGES CXX)


find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(yaml-cpp 0.6.3 EXACT CONFIG REQUIRED)

add_executable(main
  main.cpp
  flatset/flatset.cpp
  filesystem/filesystem.cpp
  fem/fem.cpp
  yamlParser/yamlParser.cpp
)

deal_ii_setup_target(main)
target_link_libraries(main Boost::filesystem yaml-cpp)