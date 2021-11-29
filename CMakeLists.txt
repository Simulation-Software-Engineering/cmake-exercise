cmake_minimum_required(VERSION 3.4)

project(cmake_exercise)

set(CMAKE_BUILD_TYPE Release)

add_executable("${CMAKE_PROJECT_NAME}" main.cpp flatset/flatset.cpp filesystem/filesystem.cpp fem/fem.cpp)
target_include_directories("${CMAKE_PROJECT_NAME}" PRIVATE flatset filesystem)

FIND_PACKAGE(deal.II 9.1.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()
DEAL_II_SETUP_TARGET(${CMAKE_PROJECT_NAME})


find_package(Boost 1.67 REQUIRED COMPONENTS filesystem)
if(Boost_FOUND)
	include_directories(${Boost_INCLUDE_DIRS})
	target_link_libraries("${CMAKE_PROJECT_NAME}" ${Boost_LIBRARIES})
endif()
