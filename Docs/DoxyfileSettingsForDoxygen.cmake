cmake_minimum_required(VERSION 3.26.0...3.26.3)

# Settings specific/exclusive to Doxygen (they are different for Sphinx)
# set(DOXYGEN_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/DocsOut/doxygen)
set(DOXYGEN_OUTPUT_DIRECTORY ${doxygenDirForDoxygen})
set(DOXYGEN_FULL_PATH_NAMES NO)
set(DOXYGEN_CALL_GRAPH YES)
set(DOXYGEN_CALLER_GRAPH YES)
set(DOXYGEN_GENERATE_TREEVIEW YES)
set(DOXYGEN_SEARCHENGINE YES)
set(DOXYGEN_GENERATE_LATEX YES) # NO to supress pdf documentation

# This target name is incorporated into CMake's auto-generated Doxyfile name
doxygen_add_docs(docs-doxygen
    # ${sourceCodeBaseDir} 
    ${CMAKE_SOURCE_DIR}/Code
    ${CMAKE_SOURCE_DIR}/README.md
    # ALL
    COMMENT "Doxygen: generating HTML documentation for Doxygen only - no Sphinx"
)

set(doxyfileName ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile.docs-doxygen)

if (EXISTS ${doxyfileName} AND NOT IS_DIRECTORY ${doxyfileName})
    message(STATUS "Generated doxyfile for Doxygen - NOT FOR SPHINX:\n" ${doxyfileName})
else()
    message(WARNING "Failed to gGenerate doxyfile: " ${doxyfileName})
endif()

add_custom_target(docs-doxygen-open
    # COMMENT "Be sure to first run: cmake --build <buildDir> ... --target docs-doxygen"
    COMMENT "Be sure to first run: cmake --build <buildDir> ... --target docs-doxygenNotSphinx"
    COMMAND ${DOXYGEN_OUTPUT_DIRECTORY}/html/index.html
    VERBATIM
)

# add_dependencies(docs-doxygen-open docs-doxygen)
set(latexDocumentName ${CMAKE_PROJECT_NAME}.pdf)

if(${DOXYGEN_GENERATE_LATEX})
    add_custom_target(docs-latex
        COMMENT	"LaTeX: generating pdf documentation"
        COMMAND make pdf
        # WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/latex
        WORKING_DIRECTORY ${DOXYGEN_OUTPUT_DIRECTORY}/latex
        VERBATIM
    )

    set(latexDocumentName ${CMAKE_PROJECT_NAME}.pdf)

    add_custom_target(docs-latex-open
        COMMENT "Be sure to first run: cmake --build <buildDir> ... --target docs-latex"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different ${DOXYGEN_OUTPUT_DIRECTORY}/latex/refman.pdf ${DOXYGEN_OUTPUT_DIRECTORY}/latex/${latexDocumentName}
        # COMMAND ${DOXYGEN_OUTPUT_DIRECTORY}/latex/${latexDocumentName}
        VERBATIM
    )

    # add_dependencies(docs-latex-open docs-latex)
endif()
