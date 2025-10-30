set(TARGET hello)
set(SOURCE_LIST hello.cpp)
set(INCLUDE_DIR_LIST "")
set(LIBRARY_LIST "")

create_executable("${TARGET}" "${SOURCE_LIST}" "${INCLUDE_DIR_LIST}" "${LIBRARY_LIST}")
install(TARGETS hello)

set(TARGET add)
set(SOURCE_LIST add.cpp)
set(INCLUDE_DIR_LIST "")
set(LIBRARY_LIST "")

create_library("${TARGET}" "${SOURCE_LIST}" "${INCLUDE_DIR_LIST}" "${LIBRARY_LIST}")

add_executable(useadd useadd.cpp)
target_include_directories(useadd PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(useadd PRIVATE add)