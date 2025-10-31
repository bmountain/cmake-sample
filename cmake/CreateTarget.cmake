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
target_compile_options(${TARGET} PRIVATE $<$<CONFIG:Asan>:-fsanitize=address -fno-omit-frame-pointer>)
target_link_options(${TARGET} PRIVATE $<$<CONFIG:Asan>:-fsanitize=address>)
endfunction()


# create executable
function(create_executable)

cmake_parse_arguments(ARGS
""
"TARGET"
"SOURCES;INCLUDES;LIBRARIES"
${ARGN}
)

add_executable(${ARGS_TARGET})
target_sources(${ARGS_TARGET} PRIVATE ${ARGS_SOURCES})
target_include_directories(${ARGS_TARGET} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${ARGS_TARGET} PRIVATE ${ARGS_INCLUDES})
target_link_libraries(${ARGS_TARGET} PRIVATE ${ARGS_LIBRARIES})
set_compile_definition(${ARGS_TARGET})
set_compile_options(${ARGS_TARGET})

endfunction()


# create library
function(create_library) 

cmake_parse_arguments(ARGS
""
"TARGET"
"SOURCES;INCLUDES;LIBRARIES"
${ARGN}
)

add_library(${ARGS_TARGET} STATIC)
target_sources(${ARGS_TARGET} PRIVATE ${ARGS_SOURCES})
target_include_directories(${ARGS_TARGET} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${ARGS_TARGET} PRIVATE ${ARGS_INCLUDES})
target_link_libraries(${ARGS_TARGET} PRIVATE ${ARGS_LIBRARIES})
set_compile_definition(${ARGS_TARGET})
set_compile_options(${ARGS_TARGET})

endfunction()


# create header-only libary
function(create_header_only_library)

cmake_parse_arguments(ARGS
""
"TARGET"
"LIBRARIES;INCLUDES"
${ARGN}
)

add_library(${ARGS_TARGET} INTERFACE)
target_include_directories(${ARGS_TARGET} INTERFACE ${CMAKE_CURRENT_SOURCE_DIR} ${ARGS_INCLUDES})
target_link_libraries(${ARGS_TARGET} INTERFACE ${ARGS_LIBRARIES})

endfunction()