cmake_minimum_required(VERSION 3.10)

project(CMakeExercise LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Boost REQUIRED COMPONENTS container filesystem)
find_package(yaml-cpp REQUIRED)
find_package(deal.II REQUIRED)

deal_ii_initialize_cached_variables()

add_executable(main 
    main.cpp
    flatset flatset/flatset.cpp
    filesystem filesystem/filesystem.cpp
    yamlParser yamlParser/yamlParser.cpp
    fem fem/fem.cpp
)

deal_ii_setup_target(main)
target_link_libraries(main Boost::container Boost::filesystem yaml-cpp)