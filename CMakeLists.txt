cmake_minimum_required(VERSION "3.28")

project("cmake-exercise")
add_executable(cmake-exercise
    main.cpp
    fem/fem.cpp
    filesystem/filesystem.cpp
    flatset/flatset.cpp
    yamlParser/yamlParser.cpp
    )

find_package(Boost 1.67 REQUIRED COMPONENTS container filesystem)
target_link_libraries(cmake-exercise Boost::filesystem)

find_package(deal.II 9.5.0 REQUIRED)
deal_ii_setup_target(cmake-exercise)

find_library(YAML_CPP_LIBRARY
    NAMES yaml-cpp
    REQUIRED)

target_link_libraries(cmake-exercise ${YAML_CPP_LIBRARY})
