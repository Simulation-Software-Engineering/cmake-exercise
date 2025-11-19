cmake_minimum_required(VERSION "3.16.2")

# export build commands for clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project("sse_cmake_cpp")

# find packages
find_package(Boost 1.83 REQUIRED COMPONENTS filesystem)
find_package(yaml-cpp REQUIRED)
find_package(deal.II 9.5.0 REQUIRED)
deal_ii_initialize_cached_variables()

# source dependencies
add_executable(${PROJECT_NAME}
  main.cpp
  fem/fem.cpp
  filesystem/filesystem.cpp
  flatset/flatset.cpp
  yamlParser/yamlParser.cpp
)

# deal.ii setup (sets up kokkos, mpi, etc.)
deal_ii_setup_target(${PROJECT_NAME})

# link boost filesystem
target_link_libraries(${PROJECT_NAME} ${Boost_FILESYSTEM_LIBRARY})

# link yaml-cpp
target_link_libraries(${PROJECT_NAME} yaml-cpp)
