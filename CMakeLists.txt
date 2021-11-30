cmake_minimum_required(VERSION "3.12")

project("cmake_exercise_chinhali")

set(CMAKE_BUILD_TYPE Release)

# find packages
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(MPI REQUIRED)
find_package(yaml-cpp REQUIRED)

# include directories
include_directories("${MPI_INCLUDE_PATH}")
DEAL_II_INITIALIZE_CACHED_VARIABLES()
include_directories("${yaml-cpp_DIR}")

add_executable(main main.cpp fem/fem.cpp flatset/flatset.cpp filesystem/filesystem.cpp yamlParser/yamlParser.cpp)

target_link_libraries(main Boost::filesystem) 
target_link_libraries(main yaml-cpp)
DEAL_II_SETUP_TARGET(main)
