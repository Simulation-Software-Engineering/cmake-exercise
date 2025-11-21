cmake_minimum_required(VERSION 3.16)
project(cmake_exercise LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the build type" FORCE)
endif()

# Add source files
add_executable(main
  main.cpp
  flatset/flatset.cpp
  filesystem/filesystem.cpp
  fem/fem.cpp
)

# -----------------------------
# Boost (flatset + filesystem)
# -----------------------------
set(Boost_USE_MULTITHREADED ON)
find_package(Boost 1.65 REQUIRED COMPONENTS filesystem)

if(TARGET Boost::filesystem)
  message(STATUS "Using imported target Boost::filesystem")
  # Note: plain syntax (no PRIVATE) to avoid CMake keyword conflict
  target_link_libraries(main Boost::filesystem)
else()
  if(Boost_FOUND)
    message(STATUS "Using Boost variables")
    target_include_directories(main PRIVATE ${Boost_INCLUDE_DIRS})
    target_link_libraries(main ${Boost_LIBRARIES})
  else()
    message(FATAL_ERROR "Boost filesystem not found")
  endif()
endif()

# -----------------------------
# deal.II (FEM)
# -----------------------------
find_package(deal.II 9.0 REQUIRED HINTS /usr/lib/cmake/deal.II)

# Initialize deal.II macros
deal_II_initialize_cached_variables()

# Setup main target for deal.II
deal_II_setup_target(main)
