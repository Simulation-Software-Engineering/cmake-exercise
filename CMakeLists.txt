cmake_minimum_required(VERSION "3.8")
set(CMAKE_BUILD_TYPE Release)

# Define the project name.
project("cmake_exercise")

# Search for the external packages
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(MPI REQUIRED)

# specify the source files
add_executable(${PROJECT_NAME} main.cpp
    fem/fem.cpp 
    filesystem/filesystem.cpp 
    flatset/flatset.cpp 
    #yamlParser.cpp 
)

# directories
include_directories("${MPI_INCLUDE_PATH}")
target_link_libraries("${PROJECT_NAME}" Boost::filesystem)

# extra deal II stuff
DEAL_II_INITIALIZE_CACHED_VARIABLES()
DEAL_II_SETUP_TARGET(${PROJECT_NAME})

# install executable
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${PROJECT_SOURCE_DIR}/../build)