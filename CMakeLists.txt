cmake_minimum_required(VERSION 3.13)
project(cmake-exercise)

# Boost: Container is header-only, Filesystem needs to be linked
find_package(Boost REQUIRED COMPONENTS filesystem)

# yaml-cpp (built from source in the Docker image)
find_package(yaml-cpp REQUIRED)

# deal.II
find_package(deal.II REQUIRED HINTS ${DEAL_II_DIR})
DEAL_II_INITIALIZE_CACHED_VARIABLES()

add_executable(main
  main.cpp
  flatset/flatset.cpp
  filesystem/filesystem.cpp
  fem/fem.cpp
  yamlParser/yamlParser.cpp
)

# NOTE: deal.II's macros use the plain target_link_libraries signature,
# so keyword-based signatures must not be used for this target.
target_link_libraries(main Boost::filesystem yaml-cpp)

DEAL_II_SETUP_TARGET(main)
