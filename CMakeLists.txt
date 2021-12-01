cmake_minimum_required(VERSION 3.10)

# set the project name
project(CMakeExercise)

find_package(Boost COMPONENTS filesystem)

FIND_PACKAGE(deal.II
    HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)

DEAL_II_INITIALIZE_CACHED_VARIABLES()

# add the executable
add_executable(CMakeExercise main.cpp flatset/flatset.cpp filesystem/filesystem.cpp fem/fem.cpp)
#fem/fem.cpp

target_link_libraries(CMakeExercise Boost::filesystem)

DEAL_II_SETUP_TARGET(CMakeExercise)