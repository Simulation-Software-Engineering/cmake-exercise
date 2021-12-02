cmake_minimum_required(VERSION "3.12")
project("cmake_excercise")


add_executable(cmake_excercise main.cpp flatset/flatset.cpp filesystem/filesystem.cpp fem/fem.cpp)
target_include_directories("${CMAKE_PROJECT_NAME}" PRIVATE flatset filesystem)
FIND_PACKAGE(deal.II 9.1.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()
DEAL_II_SETUP_TARGET(cmake_excercise)

find_package(Boost REQUIRED COMPONENTS container filesystem)
if(Boost_FOUND)
  include_directories(${Boost_INCLUDE_DIRS})
endif()
target_link_libraries("${CMAKE_PROJECT_NAME}" ${Boost_LIBRARIES})