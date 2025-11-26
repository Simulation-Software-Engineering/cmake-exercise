cmake_minimum_required(VERSION "3.12")

project("main")

find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)

deal_ii_initialize_cached_variables()

add_executable(main main.cpp filesystem/filesystem.cpp fem/fem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)

deal_ii_setup_target(main)

target_link_libraries(main Boost::filesystem yaml-cpp)