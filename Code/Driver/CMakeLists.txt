#[==================================================[
Driver (executable program)
#]==================================================]
add_executable(targetDriver) 

target_include_directories(targetDriver
    PRIVATE
        hdr
)

target_sources(targetDriver
    PRIVATE
        src/MainDriver.cpp
        hdr/Driver.hpp
        src/Driver.cpp
)

set_target_properties(targetDriver
    PROPERTIES
        OUTPUT_NAME                         Driver
        EXPORT_NAME                         Driver
        DEBUG_POSTFIX                       "_d"
        RUNTIME_OUTPUT_DIRECTORY            ${CMAKE_BINARY_DIR}/buildOut/Driver/bin/$<CONFIG>
        PDB_OUTPUT_DIRECTORY                ${CMAKE_BINARY_DIR}/buildOut/Driver/pdb/$<CONFIG>
        RUNTIME_OUTPUT_DIRECTORY_<Config>   ${RUNTIME_OUTPUT_DIRECTORY}
        PDB_OUTPUT_DIRECTORY_<Config>       ${PDB_OUTPUT_DIRECTORY}
)

target_compile_features(targetDriver
    PRIVATE
        cxx_std_20
)

if(MSVC)

    target_compile_options(targetDriver 
        PRIVATE
            /EHsc
            /W2
            # /Wall
    )

else()

    target_compile_options(targetDriver 
        PRIVATE
            -Wall
            # -Wextra
            # -Wpedantic
    )

endif()

# target_compile_definitions(targetDriver
#     PRIVATE
# )

#[==================================================[
On Windows copy *.dll needed at runtime by the .exe into the same directory as the .exe
#]==================================================]
option(isThereDllToLinkToDriver "Switch OFF when not linking any DLLs, otherwise copy <empty> will fail!" OFF)

message("#0 isThereDllToLinkToDriver: " ${isThereDllToLinkToDriver})

if(WIN32 AND isThereDllToLinkToDriver)
    add_custom_command(TARGET targetDriver POST_BUILD
        # DEPENDS targetSharedLib1 targetSharedLib2 targetSharedLib3
        COMMAND ${CMAKE_COMMAND} -E echo "copy: $<TARGET_RUNTIME_DLLS:targetDriver>"
        COMMAND ${CMAKE_COMMAND} -E echo "to:   $<TARGET_FILE_DIR:targetDriver>"
        # COMMAND ${CMAKE_COMMAND} -E copy_if_different # BE CAREFUL! won't update dll when dll sources change
        COMMAND ${CMAKE_COMMAND} -E copy
                $<TARGET_RUNTIME_DLLS:targetDriver> 
                $<TARGET_FILE_DIR:targetDriver>
        COMMAND_EXPAND_LISTS
    )
endif()

#[==================================================[
Link executable with libraries
#]==================================================]
target_link_libraries(targetDriver
    PRIVATE 
        targetSharedOrStaticLib1
)

#[==================================================[
Run the executable 
#]==================================================]
add_custom_target(run
    COMMAND ${CMAKE_COMMAND} -E echo "execute: $<TARGET_FILE:targetDriver>"
    COMMAND $<TARGET_FILE:targetDriver>
)
