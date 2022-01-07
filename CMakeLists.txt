CMAKE_MINIMUM_REQUIRED(VERSION 3.1)

PROJECT(Haagjn-Cmake-Exercise)

#add_subdirectory(fem)
#add_subdirectory(filesystem)
#add_subdirectory(flatset)

FIND_PACKAGE(Boost REQUIRED COMPONENTS filesystem)
if(Boost_FOUND)
   include_directories(${Boost_INCLUDE_DIRS})
endif()
FIND_PACKAGE(deal.II REQUIRED
   HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
   )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

ADD_EXECUTABLE(main main.cpp flatset/flatset.cpp filesystem/filesystem.cpp fem/fem.cpp)
DEAL_II_SETUP_TARGET(main)
target_link_libraries(main Boost::filesystem)
