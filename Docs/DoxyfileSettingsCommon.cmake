# Common settings for both Doxygen and Sphinx
set(DOXYGEN_GENERATE_HTML YES)
set(DOXYGEN_GENERATE_XML NO)
set(DOXYGEN_RECURSIVE YES)
# set(DOXYGEN_EXCLUDE )
set(DOXYGEN_HTML_DYNAMIC_SECTIONS YES)
set(DOXYGEN_HTML_HEADER ${CMAKE_SOURCE_DIR}/External/doxygen-custom/header.html)
set(DOXYGEN_HTML_EXTRA_STYLESHEET ${CMAKE_SOURCE_DIR}/External/doxygen-awesome-css/doxygen-awesome.css)
set(DOXYGEN_HTML_EXTRA_FILES 
    ${CMAKE_SOURCE_DIR}/External/doxygen-awesome-css/doxygen-awesome-darkmode-toggle.js 
    ${CMAKE_SOURCE_DIR}/External/doxygen-awesome-css/doxygen-awesome-fragment-copy-button.js 
    ${CMAKE_SOURCE_DIR}/External/doxygen-awesome-css/doxygen-awesome-paragraph-link.js 
    ${CMAKE_SOURCE_DIR}/External/doxygen-awesome-css/doxygen-awesome-tabs.js
)
    
# set(DOXYGEN_USE_MATHJAX YES/NO)
set(DOXYGEN_USE_MDFILE_AS_MAINPAGE ${CMAKE_SOURCE_DIR}/README.md)

set(DOXYGEN_BUILTIN_STL_SUPPORT YES)
set(DOXYGEN_EXTRACT_ALL YES)
set(DOXYGEN_EXTRACT_PRIVATE YES)
set(DOXYGEN_EXTRACT_PRIV_VIRTUAL YES)
set(DOXYGEN_EXTRACT_STATIC YES)
set(DOXYGEN_EXTRACT_LOCAL_METHODS YES)
set(DOXYGEN_STRIP_CODE_COMMENTS NO)
set(DOXYGEN_HAVE_DOT YES)
set(DOXYGEN_CLASS_DIAGRAMS YES)
# set(DOXYGEN_UML_LOOK YES/NO)

#[==================================================[
DOXYGEN_ALIASES and DOXYGEN_VERBATIM_VARS must BOTH be set to enable ReStructuredText (rst)
syntax within code comments, e.g.

/**
* Some C++ comment!
*
* @rstStar
* .. tip::
*    This is an RST tip!
* @endrst
*/

OR

/**
    Some C++ comment!

    @rstNoStar
    .. warning::
        This is an RST warning!
    @endrst
*/
]==================================================]
set(DOXYGEN_ALIASES 
    [[rst="\verbatim embed:rst:leading-slashes"]]
    [[rstSlash="\verbatim embed:rst:leading-slashes"]]
    [[rstNoStar="\verbatim embed:rst"]]
    [[rstStar="\verbatim embed:rst:leading-asterisk"]]
    [[rstInline="\verbatim embed:rst:inline"]]
    [[endrst="\endverbatim"]]
)
set(DOXYGEN_VERBATIM_VARS DOXYGEN_ALIASES) # necessary for DOXYGEN_ALIASES

set(doxygenDirForDoxygen ${CMAKE_CURRENT_SOURCE_DIR}/DocsOut/doxygen)
set(doxygenDirForSphinx ${CMAKE_CURRENT_SOURCE_DIR}/DocsOut/doxygenForSphinx)
