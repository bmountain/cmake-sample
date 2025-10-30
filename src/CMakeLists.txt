set(TARGET hello)
set(SOURCE_LIST hello.cpp)
set(INCLUDE_DIR_LIST "")
set(LIBRARY_LIST "")

create_executable("${TARGET}" "${SOURCE_LIST}" "${LIBRARY_LIST}" "${INCLUDE_DIR_LIST}")
install(TARGETS hello)

set(TARGET add)
set(SOURCE_LIST add.cpp)
set(INCLUDE_DIR_LIST "")
set(LIBRARY_LIST "")
create_library("${TARGET}" "${SOURCE_LIST}" "${LIBRARY_LIST}" "${INCLUDE_DIR_LIST}")
create_executable("useadd" "useadd.cpp" "add" "")
