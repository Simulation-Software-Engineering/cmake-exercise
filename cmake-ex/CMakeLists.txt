cmake_minimum_required(VERSION 3.10)

# Set the project name
project(cmake_exercise)

# Set source files
set(SOURCES
	filesystem/filesystem.cpp
	flatset/flatset.cpp
	fem/fem.cpp
	yamlParser/yamlParser.cpp
)

# Add the executable
add_executable(${PROJECT_NAME}
	main.cpp
	${SOURCES}	
)

# Add boost
find_package(Boost 1.67 REQUIRED COMPONENTS filesystem)
IF (Boost_FOUND)
    INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIR})
    ADD_DEFINITIONS( "-DHAS_BOOST" )
    # link the filesystem library
    target_link_libraries(${PROJECT_NAME} ${Boost_LIBRARIES})
ENDIF()

# Add deal.II
# set(CMAKE_MODULE_PATH ~/projects/fenics/dealII/build)
find_package(deal.II REQUIRED)
# find_package(deal.II REQUIRED
	# HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
	#	HINTS ${DEAL_II_DIR} "~/projects/fenics/"
	#  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()
DEAL_II_SETUP_TARGET(${PROJECT_NAME})
#set(CMAKE_PREFIX_PATH "~/projects/fenics/dealII")

# Add MPI
find_package(MPI REQUIRED)
include_directories(${MPI_INCLUDE_PATH})

# Add yaml-cpp
find_package(yaml-cpp REQUIRED)
include_directories(${yaml-cpp_DIR})
target_link_libraries(${PROJECT_NAME} yaml-cpp)
