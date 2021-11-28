cmake_minimum_required(VERSION "3.10")

project("a_meaningful_project_name")

# Find all files
set(SRC_FILES
    src/main.cpp
    src/fem/fem.cpp
    src/flatset/flatset.cpp
    src/filesystem/filesystem.cpp
    src/yamlParser/yamlParser.cpp)
message("Compiling the following files: ${SRC_FILES}")

# Find all libraries
find_package(MPI REQUIRED)
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)

# Print out information about the libraries
message("Found MPI ${MPI_VERSION} at ${MPI_LIBRARY_DIRS}")
message("Found Boost ${Boost_VERSION} at ${Boost_LIBRARY_DIRS}")
message("Found deal.II ${DEAL_II_VERSION} at ${DEAL_II_PATH}")
message("Found yaml-cpp ${yaml-cpp_VERSION} at ${yaml-cpp_DIR}")

# Setup library specific stuff
include_directories("${MPI_INCLUDE_PATH}")
include_directories("${yaml-cpp_DIR}")
DEAL_II_INITIALIZE_CACHED_VARIABLES()

# Add the binary target and link against it
add_executable("${PROJECT_NAME}" "${SRC_FILES}")
DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
target_link_libraries("${PROJECT_NAME}" Boost::filesystem yaml-cpp)
