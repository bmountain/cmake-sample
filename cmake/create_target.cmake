# Set -DDEBUG for Debug and Asan. Set -DNDEBUG for others.
function(set_compile_definition TARGET)
target_compile_definitions(${TARGET} PRIVATE
$<$<OR:$<CONFIG:Debug>,$<CONFIG:Asan>>:DEBUG>
$<$<NOT:$<OR:$<CONFIG:Debug>,$<CONFIG:Asan>>>:NDEBUG>
)
endfunction()

# Set -g3 -O0 for Debug and Asan. Set -O2 for others.
function(set_compile_options TARGET)
target_compile_options(${TARGET} PRIVATE
$<$<OR:$<CONFIG:Debug>,$<CONFIG:Asan>>:-g3 -O0>
$<$<NOT:$<OR:$<CONFIG:Debug>,$<CONFIG:Asan>>>:-O2>
)
endfunction()

function(set_asan TARGET)
  target_compile_options(${TARGET} PRIVATE $<$<CONFIG:Asan>:-fsanitize=address>)
  target_link_options(${TARGET} PRIVATE $<$<CONFIG:Asan>:-fsanitize=address>)
    set_target_properties(${TARGET} PROPERTIES
      LIBRARY_OUTPUT_DIRECTORY $<$<CONFIG:Asan>:lib>
      RUNTIME_OUTPUT_DIRECTORY $<$<CONFIG:Asan>:lib>
      ARCHIVE_OUTPUT_DIRECTORY $<$<CONFIG:Asan>:lib>
    )
endfunction()

# create executable
function(create_executable 
TARGET
SOURCE_LIST
LIBRARY_LIST
INCLUDE_DIR_LIST
)
add_executable(${TARGET})
target_sources(${TARGET} PRIVATE ${SOURCE_LIST})
target_include_directories(${TARGET} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${TARGET} PRIVATE ${INCLUDE_DIR_LIST})
target_link_libraries(${TARGET} PRIVATE ${LIBRARY_LIST})
set_compile_definition(${TARGET})
set_compile_options(${TARGET})
set_asan(${TARGET})
endfunction()

# create library
function(create_library
TARGET
SOURCE_LIST
LIBRARY_LIST
INCLUDE_DIR_LIST
) 

set(LIB_TYPE 
$<$<CONFIG:Asan>:SHARED>
$<$<NOT$<CONFIG:Asan>>:STATIC>
)
add_library(${TARGET} $<IF$<CONFIG:Asan>,SHARED,STATIC>)

target_sources(${TARGET} PRIVATE ${SOURCE_LIST})
target_include_directories(${TARGET} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${TARGET} PRIVATE ${INCLUDE_DIR_LIST})
target_link_libraries(${TARGET} PRIVATE ${LIBRARY_LIST})
set_compile_definition(${TARGET})
set_compile_options(${TARGET})
set_asan(${TARGET})
endfunction()

# create header-only libary
function(create_header_only_library
TARGET
LIBRARY_LIST
INCLUDE_DIR_LIST
)
add_library(${TARGET} INTERFACE)
target_include_directories(${TARGET} INTERFACE ${CMAKE_CURRENT_SOURCE_DIR} ${INCLUDE_DIR_LIST})
target_link_libraries(${TARGET} INTERFACE ${LIBRARY_LIST})
set_asan(${TARGET})
endfunction()