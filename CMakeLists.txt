cmake_minimum_required(VERSION "3.12")

# set the project name
project(CMakeExercise)
set(CMAKE_BUILD_TYPE Release)

set(CMAKE_BUID_TYPE Release) 

find_package(Boost COMPONENTS filesystem)

FIND_PACKAGE(deal.II REQUIRED)

find_package(MPI REQUIRED)

include_directories("${MPI_INCLUDE_PATH}")

DEAL_II_INITIALIZE_CACHED_VARIABLES()

# add the executable
add_executable(CMakeExercise main.cpp fem/fem.cpp flatset/flatset.cpp filesystem/filesystem.cpp)
#fem/fem.cpp

target_link_libraries(CMakeExercise Boost::filesystem)

DEAL_II_SETUP_TARGET(CMakeExercise)
