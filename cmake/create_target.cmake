# create executable
function(create_executable 
TARGET
SOURCE_LIST
INCLUDE_DIR_LIST
LIBRARY_LIST
)

# Define target
add_executable(${TARGET})
# Set sources
target_sources(${TARGET} PRIVATE ${SOURCE_LIST})
# Set include directories
target_include_directories(${TARGET} PRIVATE ${INCLUDE_DIR_LIST})
# Set libraries to link
target_link_libraries(${TARGET} PRIVATE ${LIBRARY_LIST})

# Compile definitions.
# Set -DDEBUG for Debug and Asan. Set -DNDEBUG otherwise.
target_compile_definitions(${TARGET} PRIVATE $<IF:$<OR:$<CONFIG:Debug>,$<CONFIG:Asan>>,DEBUG,NDEBUG>)

# Set -g3 -O0 for Debug and Asan
target_compile_options(${TARGET} PRIVATE $<IF:$<OR:$<CONFIG:Debug>,$<CONFIG:Asan>>,-g3 -O0,-O2>)
endfunction()
