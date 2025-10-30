set(TARGET hello)
set(SOURCE_LIST hello.cpp)
set(INCLUDE_DIR_LIST "")
set(LIBRARY_LIST "")

create_executable("${TARGET}" "${SOURCE_LIST}" "${INCLUDE_DIR_LIST}" "${LIBRARY_LIST}")
install(TARGETS hello)