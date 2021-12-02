cmake_minimum_required(VERSION "3.8")

# name of the project and the export binary basically
project("cmake_exercise")

# for deal II ("was configured with debug release")
set(CMAKE_BUILD_TYPE Release)

# specify source files (.cpp)
add_executable(${PROJECT_NAME} 
    main.cpp
    fem/fem.cpp
    filesystem/filesystem.cpp
    flatset/flatset.cpp
)

# finding necesssary (required) packages
find_package(deal.II REQUIRED)
find_package(MPI REQUIRED)

# with components we select just the necessary component
find_package(Boost REQUIRED COMPONENTS filesystem)

include_directories("${MPI_INCLUDE_PATH}")

# link binaries with libraries
target_link_libraries(${PROJECT_NAME} ${MPI_LIBRARIES})
target_link_libraries("${PROJECT_NAME}" Boost::filesystem)

# deal ii setup initialisation 
DEAL_II_INITIALIZE_CACHED_VARIABLES()
DEAL_II_SETUP_TARGET(${PROJECT_NAME})

# configuring the make install configuration
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${PROJECT_SOURCE_DIR}/../build)

