cmake_minimum_required(VERSION 3.26.0...3.26.3)

# Settings specific/exclusive to Sphinx (some are different for Doxygen)
# set(DOXYGEN_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/DocsOut/doxygenForSphinx)
set(DOXYGEN_OUTPUT_DIRECTORY ${doxygenDirForSphinx})
set(sourceCodeBaseDir ${CMAKE_SOURCE_DIR}/Code)
set(DOXYGEN_FULL_PATH_NAMES YES)
set(DOXYGEN_STRIP_FROM_PATH ${sourceCodeBaseDir})
set(DOXYGEN_CALL_GRAPH NO)
set(DOXYGEN_CALLER_GRAPH NO)

set(DOXYGEN_GENERATE_TREEVIEW NO)
set(DOXYGEN_SEARCHENGINE NO)
set(DOXYGEN_DISABLE_INDEX NO)
set(DOXYGEN_CREATE_SUBDIRS NO)

set(DOXYGEN_DOT_IMAGE_FORMAT svg)
set(DOXYGEN_INTERACTIVE_SVG YES)
set(DOXYGEN_DOT_TRANSPARENT YES)
set(DOXYGEN_GENERATE_TAGFILE ${DOXYGEN_OUTPUT_DIRECTORY}/html/tagfile.xml)
set(DOXYGEN_GENERATE_LATEX NO)

# This target name is incorporated into CMake's auto-generated Doxyfile name
doxygen_add_docs(docs-sphinxNotDoxygen
    ${sourceCodeBaseDir} 
    ${CMAKE_SOURCE_DIR}/README.md
    # ALL
    COMMENT "Doxygen: generating HTML documentation for Sphinx, not for Doxygen"
)

set(doxyfileName ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile.docs-sphinxNotDoxygen)

if (EXISTS ${doxyfileName} AND NOT IS_DIRECTORY ${doxyfileName})
    message(STATUS "Generated doxyfile for Sphinx - NOT FOR DOXYGEN:\n" ${doxyfileName})
else()
    message(WARNING "Failed to gGenerate doxyfile: " ${doxyfileName})
endif()