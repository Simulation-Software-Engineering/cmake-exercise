cmake_minimum_required(VERSION "3.12")
project("CMakeExerciseGeldnens")

find_package(Boost REQUIRED COMPONENTS container filesystem)
if(Boost_FOUND)
  # for headers
  include_directories(${Boost_INCLUDE_DIRS})
endif()

add_executable(cmake-geldnens main.cpp flatset/flatset.cpp filesystem/filesystem.cpp)

# container stuff is header-only - could also be added here, but unnecessary
target_link_libraries(cmake-geldnens Boost::filesystem)
