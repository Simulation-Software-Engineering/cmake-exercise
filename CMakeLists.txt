cmake_minimum_required(VERSION 3.15)

project("cmake-exercise")

find_package(deal.II REQUIRED)

deal_ii_initialize_cached_variables()

find_package(Boost CONFIG REQUIRED COMPONENTS filesystem)

add_executable(main main.cpp flatset/flatset.cpp filesystem/filesystem.cpp fem/fem.cpp)

deal_ii_setup_target(main)

target_link_libraries(main Boost::headers Boost::filesystem)