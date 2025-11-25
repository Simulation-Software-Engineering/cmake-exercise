cmake_minimum_required(VERSION 3.16)
project(CMakeExercise LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# CRITICAL: Add link directories BEFORE creating executable
link_directories(/usr/local/lib)

# ---------- Find Packages ----------
# Boost (filesystem + header-only container)
find_package(Boost REQUIRED COMPONENTS filesystem system)

# deal.II (FEM)
find_package(deal.II REQUIRED
    HINTS ${DEAL_II_DIR} $ENV{DEAL_II_DIR}
)

# yaml-cpp (manually specify since it's in /usr/local)
find_library(YAML_CPP_LIBRARY
    NAMES yaml-cpp
    PATHS /usr/local/lib
    REQUIRED
)

# ---------- Sources ----------
set(SOURCES
    main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

# ---------- Create Executable ----------
add_executable(main ${SOURCES})

# ---------- Include Directories ----------
target_include_directories(main PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${Boost_INCLUDE_DIRS}
    /usr/local/include
)

# ---------- deal.II Setup (must come AFTER add_executable) ----------
deal_ii_initialize_cached_variables()
deal_ii_setup_target(main)

# ---------- Link Libraries ----------
# CRITICAL: yaml-cpp must be linked AFTER deal.II setup
target_link_libraries(main
    ${Boost_LIBRARIES}
    ${YAML_CPP_LIBRARY}
)