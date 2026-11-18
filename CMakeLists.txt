cmake_minimum_required(VERSION 3.12)

project("CmakeVonrosmo")

# CONFIG required to not hit policy CMP0167 on newer CMake versions
find_package(Boost CONFIG REQUIRED COMPONENTS filesystem)

find_package(deal.II 9.5.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
deal_ii_initialize_cached_variables()

file(GLOB_RECURSE SRC_FLATSET flatset/*.cpp flatset/*.hpp)
add_library(flatset ${SRC_FLATSET})
target_link_libraries(flatset PRIVATE Boost::headers)

file(GLOB_RECURSE SRC_FILESYSTEM filesystem/*.cpp filesystem/*.hpp)
add_library(filesystem ${SRC_FILESYSTEM})
target_link_libraries(filesystem PRIVATE Boost::filesystem)

file(GLOB_RECURSE SRC_FEM fem/*.cpp fem/*.hpp)
add_library(fem ${SRC_FEM})
deal_ii_setup_target(fem)

file(GLOB_RECURSE SRC_YAML_PARSER yamlParser/*.cpp yamlParser/*.hpp)
add_library(yamlParser ${SRC_YAML_PARSER})
target_link_libraries(yamlParser PRIVATE yaml-cpp)

add_executable(main main.cpp)
target_link_libraries(main flatset filesystem fem yamlParser)
