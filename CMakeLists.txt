cmake_minimum_required(VERSION "3.12")

project("CMakeExerciseJonatan")

find_package(Boost REQUIRED COMPONENTS container filesystem)
find_package(deal.II 9.5.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
find_package(yaml-cpp REQUIRED)

deal_ii_initialize_cached_variables()

add_executable(main
	fem/fem.cpp
	fem/fem.hpp
	filesystem/filesystem.cpp
	filesystem/filesystem.hpp
	flatset/flatset.cpp
	flatset/flatset.hpp
	main.cpp
	yamlParser/yamlParser.cpp
	yamlParser/yamlParser.hpp
)

deal_ii_setup_target(main)

target_link_libraries(main
	Boost::container
	Boost::filesystem
	yaml-cpp
)