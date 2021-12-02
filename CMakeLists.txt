cmake_minimum_required(VERSION "3.12")

project("CMakeExercise")

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp fem/fem.cpp filesystem/filesystem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)
add_executable(main "${SRC_FILES}")

# We rely that the system installation of deal.II is found
find_package(deal.II 9.1 REQUIRED)

# deal.II magic macros for linking
DEAL_II_INITIALIZE_CACHED_VARIABLES()
DEAL_II_SETUP_TARGET(main)

# Uses the FindBoost module of CMake
find_package(Boost 1.65.1 COMPONENTS filesystem REQUIRED)

target_link_libraries(main Boost::filesystem yaml-cpp)


