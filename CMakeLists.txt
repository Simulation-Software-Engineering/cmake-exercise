cmake_minimum_required(VERSION 3.4)

project(cmake_exercise)

add_executable("${CMAKE_PROJECT_NAME}" main.cpp flatset/flatset.cpp filesystem/filesystem.cpp)

target_include_directories("${CMAKE_PROJECT_NAME}" PRIVATE flatset filesystem)

find_package(Boost 1.67 REQUIRED COMPONENTS filesystem)
if(Boost_FOUND)
	include_directories(${Boost_INCLUDE_DIRS})
	#add_executable(flatset flatset/flatset.cpp)
	target_link_libraries("${CMAKE_PROJECT_NAME}" ${Boost_LIBRARIES})
endif()
