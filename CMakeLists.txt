cmake_minimum_required(VERSION 3.26.0...3.26.3)

include(CMakeUtils/Handy/DisallowInSourceBuilds.cmake) # Comment out to allow
include(CMakeUtils/Handy/SelectCompilerViaFlagIfNotUsingCMakePresets.cmake) # or else default compiler will be used

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
project(SharedOrStaticLibChain VERSION 0.1.0 LANGUAGES C CXX)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

include(CMakeUtils/Handy/DisplayGenericInfo.cmake) # Comment out to suppress

#[==================================================[
Build (sub)project(s)
#]==================================================]
add_subdirectory(Code/SharedOrStaticLib1)
add_subdirectory(Code/SharedOrStaticLib2)
add_subdirectory(Code/SharedOrStaticLib3)
add_subdirectory(Code/Driver) # MUST BE LAST to ensure correct value of isThereDllToLinkToDriver

#[==================================================[
Build documentation
#]==================================================]
# add_subdirectory(Docs)

#[==================================================[
(Optional) IDE solution name
Must be after all other projects since last project(...) is used as solution name
#]==================================================]
if (CMAKE_GENERATOR MATCHES "Visual Studio" OR  # any VS generator
    CMAKE_GENERATOR MATCHES "Eclipse CDT4")     # any Eclipse generator

    project(ChainLibraries)

endif()

message(STATUS "isCMakePresetsInvoked: " ${isCMakePresetsInvoked})
# unset(isCMakePresetsInvoked CACHE)
# message(STATUS "isCMakePresetsInvoked: " ${isCMakePresetsInvoked})
