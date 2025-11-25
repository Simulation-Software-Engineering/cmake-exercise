cmake_minimum_required(VERSION 3.28)

project(cmake_exercise)

find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)

add_executable(main
    main.cpp
    filesystem/filesystem.cpp
    flatset/flatset.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

target_link_libraries(main ${Boost_LIBRARIES} yaml-cpp)

deal_ii_setup_target(main)
