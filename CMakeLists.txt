cmake_minimum_required(VERSION 3.16)

# deal.II has to be found before project() so that it can set up compiler and flags
find_package(deal.II REQUIRED HINTS ${DEAL_II_DIR} $ENV{DEAL_II_DIR})
deal_ii_initialize_cached_variables()

project(main LANGUAGES CXX)

# Boost Container is header-only, Boost Filesystem needs to be linked
find_package(Boost REQUIRED COMPONENTS filesystem)

# yaml-cpp is built from source in exactly this version (see Dockerfile)
find_package(yaml-cpp 0.6.3 EXACT REQUIRED)

add_executable(main
  main.cpp
  fem/fem.cpp
  flatset/flatset.cpp
  filesystem/filesystem.cpp
  yamlParser/yamlParser.cpp
)

# Adds the deal.II include directories, compile flags and libraries to the target
deal_ii_setup_target(main)

# deal_ii_setup_target() uses the plain signature of target_link_libraries(),
# so we cannot use the keyword signature (PRIVATE/PUBLIC) here
target_link_libraries(main Boost::filesystem yaml-cpp)
