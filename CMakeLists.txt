cmake_minimum_required(VERSION "3.12")
project("CMake Exercise")

find_package(Boost REQUIRED COMPONENTS container filesystem)

find_package(deal.II 9.5.0 REQUIRED)
deal_ii_initialize_cached_variables()

find_package(yaml-cpp REQUIRED)

set(SRC_FILES fem/fem.cpp flatset/flatset.cpp filesystem/filesystem.cpp yamlParser/yamlParser.cpp)

add_executable(main main.cpp "${SRC_FILES}")

target_link_libraries(main Boost::filesystem yaml-cpp)
deal_ii_setup_target(main)
