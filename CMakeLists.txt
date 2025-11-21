add_executable(main
  main.cpp
  flatset/flatset.cpp
  filesystem/filesystem.cpp
  fem/fem.cpp
  yamlParser/yamlParser.cpp
)

set(Boost_USE_MULTITHREADED ON)
find_package(Boost 1.65 REQUIRED COMPONENTS filesystem)
if(TARGET Boost::filesystem)
  message(STATUS "Using imported target Boost::filesystem")
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

find_package(yaml-cpp 0.6.3 REQUIRED)
target_link_libraries(main yaml-cpp)

find_package(deal.II 9.0 REQUIRED HINTS /usr/lib/cmake/deal.II)
deal_II_initialize_cached_variables()
deal_II_setup_target(main)
