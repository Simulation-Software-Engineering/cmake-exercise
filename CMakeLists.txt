cmake_minimum_required(VERSION "3.12")

project("excersie")


set(CMAKE_BUILD_TYPE Release)

# find packages
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
#required to run deal_II correctly
find_package(MPI REQUIRED)

# include directories
include_directories("${MPI_INCLUDE_PATH}")
DEAL_II_INITIALIZE_CACHED_VARIABLES()
add_executable(excersie main.cpp fem/fem.cpp flatset/flatset.cpp filesystem/filesystem.cpp)

target_link_libraries(excersie Boost::filesystem) 
DEAL_II_SETUP_TARGET(excersie)