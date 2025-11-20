cmake_minimum_required(VERSION 3.10)
project(CMakeExercise)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Boost
find_package(Boost REQUIRED COMPONENTS filesystem)

# Find deal.II
find_package(deal.II REQUIRED)

# Find yaml-cpp
find_library(YAML_CPP_LIBRARY yaml-cpp PATHS /usr/local/lib /usr/lib)
find_path(YAML_CPP_INCLUDE_DIR yaml-cpp/yaml.h PATHS /usr/local/include /usr/include)

if(YAML_CPP_LIBRARY AND YAML_CPP_INCLUDE_DIR)
    message(STATUS "Found yaml-cpp: ${YAML_CPP_LIBRARY}")
    set(yaml-cpp_FOUND TRUE)
else()
    message(FATAL_ERROR "yaml-cpp not found. Please ensure it is installed in /usr/local")
endif()

# Add executable
add_executable(main
    main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

# Link Boost libraries
target_link_libraries(main
    Boost::filesystem
)

# Link deal.II
deal_ii_setup_target(main)

# Link yaml-cpp
target_include_directories(main PRIVATE ${YAML_CPP_INCLUDE_DIR})
target_link_libraries(main ${YAML_CPP_LIBRARY})

