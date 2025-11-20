cmake_minimum_required(VERSION "3.12")
project("cmake-exercise")

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp fem/fem.cpp filesystem/filesystem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)

find_package(Boost REQUIRED COMPONENTS filesystem)

find_package(deal.II REQUIRED HINTS ${DEAL_II_DIR})
deal_ii_initialize_cached_variables()

find_package(yaml-cpp 0.6.3 EXACT REQUIRED PATHS /usr/local/lib/cmake/yaml-cpp)

add_executable(main "${SRC_FILES}")

target_link_libraries(main Boost::filesystem yaml-cpp)
deal_ii_setup_target(main)
