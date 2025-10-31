create_executable(
TARGET
  hello
SOURCES
  hello.cpp
)

create_library(
TARGET
  add
SOURCES
  add.cpp
)

create_executable(
TARGET
  useadd
SOURCES
  useadd.cpp
LIBRARIES
  add
)

create_executable(
TARGET
  use_unordered_map
SOURCES
  use_unordered_map.cpp
)
target_compile_definitions(use_unordered_map PRIVATE $<$<CONFIG:Test>:NO_UNORDERED_MAP>)

install(TARGETS hello useadd use_unordered_map)