cmake_minimum_required(VERSION 3.22)

project(cmake-exercise)

add_executable(main main.cpp fem/fem.cpp filesystem/filesystem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)

find_package(yaml-cpp 0.6.3 REQUIRED)
find_package(Boost 1.83 REQUIRED COMPONENTS filesystem container)
find_package(deal.II 9.5.1 REQUIRED)

target_link_libraries(main ${Boost_LIBRARIES} yaml-cpp)
target_include_directories(main PRIVATE ${Boost_INCLUDE_DIR})

deal_ii_initialize_cached_variables()
deal_ii_setup_target(main)