cmake_minimum_required(VERSION 3.10)

FIND_PACKAGE(deal.II 9.3.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

# set the project name
project(CMake-Exercise)

add_subdirectory(fem)
add_subdirectory(filesystem)
add_subdirectory(flatset)
#add_subdirectory(yamlParser)

# add the executable

find_package(Boost COMPONENTS system filesystem)
#find_package(MPI REQUIRED)

#ADD_LIBRARY(mylib fem filesystem)
#DEAL_II_SETUP_TARGET(mylib)

add_executable(main main.cpp)
DEAL_II_SETUP_TARGET(main)


#target_link_libraries(main ${MPI_LIBRARIES})
target_link_libraries(main
			${Boost_LIBRARIES}  
			fem
			filesystem
			flatset
#			yamlParser
#			"/usr/local/lib/"
			)

#include_directories(${MPI_INCLUDE_PATH})
#include_directories( 	${Boost_INCLUDE_DIRS} 
#			${MPI_CXX_INCLUDE_PATH}
#			"${PROJECT_BINARY_DIR}/fem"
#			"${PROJECT_BINARY_DIR}/filesystem"
#			)

target_include_directories(main PUBLIC
#			PUBLIC ${MPI_CXX_INCLUDE_DIRS}
			"${Boost_INCLUDE_DIR}"
			"${PROJECT_BINARY_DIR}"
                       "${PROJECT_BINARY_DIR}/fem"
                       "${PROJECT_BINARY_DIR}/filesystem"
                       "${PROJECT_SOURCE_DIR}/flatset"
#                      "${PROJECT_SOURCE_DIR}/yamlParser"
#                      "${PROJECT_SOURCE_DIR}/yamlParser"
#                      "${PROJECT_SOURCE_DIR}/yamlParser/yaml-cpp-yaml-cpp-0.7.0/include"
#			"/usr/local/include"
                     )


message(STATUS "Boost_INCLUDE_DIR: ${Boost_INCLUDE_DIR}")
message(STATUS "Boost_LIBRARIES: ${Boost_LIBRARIES}")
