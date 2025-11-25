cmake_minimum_required(VERSION 3.16)
project(cmake_exercise)

set(CMAKE_CXX_STANDARD 17)

add_executable(main
    main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

# --- BOOST ---
find_package(Boost REQUIRED COMPONENTS filesystem)
target_link_libraries(main Boost::filesystem)

# --- DEAL.II ---
find_package(deal.II REQUIRED)
deal_ii_initialize_cached_variables()
deal_ii_setup_target(main)

# --- YAML.CPP ---
find_package(yaml-cpp 0.6.3 REQUIRED)
target_link_libraries(main yaml-cpp)