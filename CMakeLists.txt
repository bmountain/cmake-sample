cmake_minimum_required(VERSION 4.1.2)
project(sample 
  LANGUAGES CXX 
  VERSION 0.0.1
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(CreateTarget)
include(EnableCcache)
include(InitializeFlags)

add_subdirectory(src)

include(GenerateDoxygen)
generate_doxygen(src doxygen)