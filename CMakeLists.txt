cmake_minimum_required(VERSION 3.10)

project(cmake-exercise LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(yaml-cpp REQUIRED)
find_package(deal.II 9.5.1 REQUIRED
    HINTS /usr/share/cmake/deal.II
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)

add_executable(main
    main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    yamlParser/yamlParser.cpp
    fem/fem.cpp
)

target_link_libraries(main Boost::filesystem yaml-cpp)
deal_ii_setup_target(main)