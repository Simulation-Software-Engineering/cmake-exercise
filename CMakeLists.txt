cmake_minimum_required(VERSION 3.14)

project(FightingDependencies)

# --- 1. Find Dependencies ---

# Boost: We need filesystem (linked) and system. 
# Container is header-only so it comes along for the ride.
find_package(Boost REQUIRED COMPONENTS filesystem system)

# deal.II: The heavy FEM library
find_package(deal.II REQUIRED)

# yaml-cpp: The manual install
find_package(yaml-cpp REQUIRED)


# --- 2. Define the Executable ---

add_executable(main 
    main.cpp
    # We must compile the implementation files in the subdirectories
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)


# --- 3. Include Directories ---

# This allows main.cpp to do #include "flatset.hpp" without adding the path prefix
target_include_directories(main PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/flatset
    ${CMAKE_CURRENT_SOURCE_DIR}/filesystem
    ${CMAKE_CURRENT_SOURCE_DIR}/fem
    ${CMAKE_CURRENT_SOURCE_DIR}/yamlParser
)


# --- 4. Link Libraries ---

# Link Boost and Yaml
target_link_libraries(main  
    Boost::filesystem 
    yaml-cpp
)

# Deal.II usually prefers its own macro to setup the target
# This attaches all necessary libraries and compile flags to 'main'
DEAL_II_SETUP_TARGET(main)