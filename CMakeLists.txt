cmake_minimum_required(VERSION "3.12")

FIND_PACKAGE(deal.II 9.1.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

project("cmake-exercise-ajaust")

find_package(Boost
  1.71.0
  REQUIRED
  filesystem
  )

find_package(yaml-cpp
  0.7.0
  REQUIRED
  )

message(STATUS "${YAML_CPP_INCLUDE_DIR}")
message(STATUS "${YAML_CPP_LIBRARIES}")

add_executable("${PROJECT_NAME}" main.cpp fem/fem.cpp flatset/flatset.cpp filesystem/filesystem.cpp yamlParser/yamlParser.cpp)
target_link_libraries("${PROJECT_NAME}" Boost::filesystem)

include_directories(${YAML_CPP_INCLUDE_DIR})
target_link_libraries("${PROJECT_NAME}" ${YAML_CPP_LIBRARIES})

DEAL_II_SETUP_TARGET("${PROJECT_NAME}")


