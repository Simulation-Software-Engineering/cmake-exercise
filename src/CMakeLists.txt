cmake_minimum_required(VERSION "3.8")

project("cmake_exercise")

set(CMAKE_BUILD_TYPE Release)

# Specify the name of the executable (${PROJECT_NAME} which is equal to what was set in the project() command).
# Also specify the source files.
add_executable(${PROJECT_NAME}
   main.cpp
   
   fem/fem.cpp

   filesystem/filesystem.cpp

   flatset/flatset.cpp
)

# find packages
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(MPI REQUIRED)

# include directories
include_directories("${MPI_INCLUDE_PATH}")
target_link_libraries(${PROJECT_NAME} ${MPI_LIBRARIES})
DEAL_II_INITIALIZE_CACHED_VARIABLES()

target_link_libraries(${PROJECT_NAME} Boost::filesystem) 
DEAL_II_SETUP_TARGET(${PROJECT_NAME})

# install cmake_exercise executable in build directory
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${PROJECT_SOURCE_DIR}/../build)