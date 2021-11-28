cmake_minimum_required(VERSION "3.10")

project("a_meaningful_project_name")
set("yaml-cpp-version" "0.7.0")

# Find all files
set(SRC_FILES
    main.cpp
    fem/fem.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    yamlParser/yamlParser.cpp)
message("Compiling the following files: ${SRC_FILES}")

# Find all libraries
find_package(MPI REQUIRED)
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)
# add_library(gtest SHARED "/tmp/googletest-release-1.11.0")
# set_target_properties(gtest PROPERTIES LINKER_LANGUAGE CXX)
# add_library(yaml-cpp SHARED "/tmp/yaml-cpp-yaml-cpp-${yaml-cpp-version}")
# set_target_properties(yaml-cpp PROPERTIES LINKER_LANGUAGE CXX)

# Print out information about the libraries
message("Found MPI ${MPI_VERSION} at ${MPI_LIBRARY_DIRS}")
message("Found Boost ${Boost_VERSION} at ${Boost_LIBRARY_DIRS}")
message("Found deal.II ${DEAL_II_VERSION} at ${DEAL_II_PATH}")
message("Found yaml-cpp ${YAML_CPP_VERSION} at ${YAML_CPP_INCLUDE_DIRS}")

# Setup library specific stuff
include_directories("${MPI_INCLUDE_PATH}")
# include_directories("${YAML_CPP_INCLUDE_DIRS}")
DEAL_II_INITIALIZE_CACHED_VARIABLES()

# Add the binary target and link against it
add_executable("${PROJECT_NAME}" "${SRC_FILES}")
DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
target_link_libraries("${PROJECT_NAME}" Boost::filesystem ${YAML_CPP_LIBRARIES} yaml-cpp)
