function(generate_doxygen input output)
  find_package(Doxygen)
  if (NOT DOXYGEN_FOUND)
    add_custom_target(doxygen COMMAND false COMMENT "Doxygen not found.")
    return()
  endif()
  set(DOXYGEN_GENERATE_HTML YES)
  set(DOXYGEN_HTML_OUTPUT ${PROJECT_SOURCE_DIR}/${output})
  doxygen_add_docs(
  doxygen ${PROJECT_SOURCE_DIR}/${input}
  COMMENT "Generate HTML document"
  GENERATE_HTML YES
  HTML_OUTPUT ${output}
  )
endfunction()