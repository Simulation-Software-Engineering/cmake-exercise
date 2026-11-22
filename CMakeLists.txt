cmake_minimum_required(VERSION "3.12")

find_package(deal.II 9.5.0 REQUIRED)
deal_ii_initialize_cached_variables()
project("cmake-docker")

find_package(Boost 1.67.0 REQUIRED COMPONENTS filesystem)
find_package(yaml-cpp 0.6.3 REQUIRED)

add_executable(main main.cpp flatset/flatset.cpp filesystem/filesystem.cpp fem/fem.cpp yamlParser/yamlParser.cpp)
deal_ii_setup_target(main)

target_link_libraries(main Boost::filesystem yaml-cpp)