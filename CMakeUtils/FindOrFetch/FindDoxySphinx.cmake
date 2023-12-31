# Look for an executable called sphinx-build
find_program(DOXYSPHINX_EXECUTABLE
    NAMES doxysphinx
    DOC "Path to doxysphinx executable"
)

include(FindPackageHandleStandardArgs)
# Handle standard arguments to find_package like REQUIRED and QUIET
find_package_handle_standard_args(DoxySphinx
    "Failed to find doxysphinx executable"
    DOXYSPHINX_EXECUTABLE
)