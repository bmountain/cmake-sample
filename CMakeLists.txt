cmake_minimum_required(VERSION 4.1.2)
project(sample 
  LANGUAGES CXX 
  VERSION 0.0.1
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(${CMAKE_SOURCE_DIR}/cmake/create_target.cmake)
set(CMAKE_CXX_FLAGS_RELEASE "" CACHE STRING "CXX compiler flags for release build" FORCE)
set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "CXX compiler flags for debug build" FORCE)

add_subdirectory(src)