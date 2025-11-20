cmake_minimum_required(VERSION 3.10)
project(cmake_exercise LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find required dependencies
find_package(Boost REQUIRED COMPONENTS filesystem system)
find_package(deal.II REQUIRED)

# Collect all .cpp files except yamlParser
file(GLOB SOURCES "${CMAKE_SOURCE_DIR}/*.cpp")
file(GLOB FEM_SOURCES "${CMAKE_SOURCE_DIR}/fem/*.cpp")
file(GLOB FLATSET_SOURCES "${CMAKE_SOURCE_DIR}/flatset/*.cpp")
file(GLOB FILESYSTEM_SOURCES "${CMAKE_SOURCE_DIR}/filesystem/*.cpp")

add_executable(main ${SOURCES} ${FEM_SOURCES} ${FLATSET_SOURCES} ${FILESYSTEM_SOURCES})

# Link deal.II using its specific macros (must be called before other target_link_libraries)
DEAL_II_SETUP_TARGET(main)

# Link Boost libraries (plain signature to match deal.II's convention)
target_link_libraries(main 
    Boost::filesystem 
    Boost::system
)
