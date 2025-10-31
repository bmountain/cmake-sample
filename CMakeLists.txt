cmake_minimum_required(VERSION 4.1.2)
project(sample 
  LANGUAGES CXX 
  VERSION 0.0.1
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(${CMAKE_SOURCE_DIR}/cmake/enable_ccache.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/initialize_flags.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/create_target.cmake)

add_subdirectory(src)

include(${CMAKE_SOURCE_DIR}/cmake/doxygen.cmake)
generate_doxygen(src doxygen)