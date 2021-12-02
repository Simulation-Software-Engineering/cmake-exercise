cmake_minimum_required(VERSION "3.0")

# project name 
project("brenchla-cmake-exercise")

# find packages on which main.cpp depends and setup for library directories
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(MPI REQUIRED)
find_package(yaml-cpp REQUIRED)

include_directories("${MPI_INCLUDE_PATH}")
DEAL_II_INITIALIZE_CACHED_VARIABLES()
include_directories("${yaml-cpp_DIR}")

# create executable and corresponding links between libraries 
add_executable("${PROJECT_NAME}" main.cpp
    flatset/flatset.cpp 
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)
target_link_libraries("${PROJECT_NAME}" Boost::filesystem)
DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
target_link_libraries("${PROJECT_NAME}" yaml-cpp)
