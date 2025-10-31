message(STATUS "Detecting optional launcher ccache")
find_program(CCACHE_EXECUTABLE ccache)
if(CCACHE_EXECUTABLE)
  set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_EXECUTABLE}")
  set(CMAKE_C_COMPILER_LAUNCHER "${CCACHE_EXECUTABLE}")
  message(STATUS "Detected optional launcher ccache: ${CCACHE_EXECUTABLE}")
else()
  message(STATUS "Optional launcher ccache not found.")
endif()

  