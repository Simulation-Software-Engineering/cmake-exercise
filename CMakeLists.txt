cmake_minimum_required(VERSION "3.12")
project("CMakeExerciseGeldnens")

find_package(Boost REQUIRED COMPONENTS container filesystem)
if(Boost_FOUND)
  # for headers
  include_directories(${Boost_INCLUDE_DIRS})
endif()

find_package(deal.II REQUIRED)
deal_ii_initialize_cached_variables()

add_executable(cmake-geldnens main.cpp flatset/flatset.cpp filesystem/filesystem.cpp fem/fem.cpp)
deal_ii_setup_target(cmake-geldnens)

# container stuff is header-only - could also be added here, but unnecessary
target_link_libraries(cmake-geldnens Boost::filesystem)
