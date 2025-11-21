cmake_minimum_required(VERSION 3.10)
project(cmake-exercise)

# Set C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Boost libraries
find_package(Boost REQUIRED COMPONENTS filesystem)

# Find deal.II
find_package(deal.II REQUIRED)
# Initialize deal.II cached variables (required for deal.II CMake setup)
deal_II_initialize_cached_variables()

# Find yaml-cpp
find_package(yaml-cpp REQUIRED)

# Source files
set(SOURCES
    main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

# Create executable
add_executable(main ${SOURCES})

# Setup deal.II target (required for deal.II CMake setup)
deal_II_setup_target(main)

# Link libraries
# Note: deal.II linking is handled by deal_II_setup_target() above
target_link_libraries(main
    Boost::filesystem
    yaml-cpp
)

# Boost Container is header-only, so we just need include directories
target_include_directories(main PRIVATE ${Boost_INCLUDE_DIRS})

