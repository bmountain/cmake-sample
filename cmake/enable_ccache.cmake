find_program(CCACHE_EXECUTABLE ccache)
if(CCACHE_EXECUTABLE)
  set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_EXECUTABLE}")
  set(CMAKE_C_COMPILER_LAUNCHER "${CCACHE_EXECUTABLE}")
  message(STATUS "ccache enabled: ${CCACHE_EXECUTABLE}")
else()
  message(STATUS "Optional build tool ccache not found.")
endif()

  