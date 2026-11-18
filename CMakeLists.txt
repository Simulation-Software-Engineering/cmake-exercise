cmake_minimum_required(VERSION "3.12")
project("CMake Exercise")

find_package(Boost REQUIRED COMPONENTS container filesystem)

find_package(deal.II 9.5.0 REQUIRED)
deal_ii_initialize_cached_variables()

find_package(yaml-cpp REQUIRED)

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS **/*.cpp)

add_library(lib "${SRC_FILES}")
add_executable(main main.cpp)

target_link_libraries(main lib Boost::filesystem yaml-cpp)
deal_ii_setup_target(main)
