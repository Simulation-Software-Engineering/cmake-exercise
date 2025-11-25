cmake_minimum_required(VERSION 3.16)
project(cmake_exercise)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Boost libraries
find_package(Boost REQUIRED COMPONENTS filesystem)

# Find deal.II
find_package(deal.II REQUIRED)

# Find yaml-cpp
find_package(yaml-cpp REQUIRED)

# deal.II setup macro
DEAL_II_INITIALIZE_CACHED_VARIABLES()

add_executable(main
    main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

# deal.II setup macro for target
DEAL_II_SETUP_TARGET(main)

target_link_libraries(main 
    Boost::filesystem
    yaml-cpp
)

target_include_directories(main PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
)

