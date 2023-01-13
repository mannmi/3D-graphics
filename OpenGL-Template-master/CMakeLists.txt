# CMake entry point
cmake_minimum_required(VERSION 3.0)
project(OpenGL-Template)

find_package(OpenGL REQUIRED)

set(CMAKE_BUILD_PARALLEL_LEVEL 8)

if (CMAKE_BINARY_DIR STREQUAL CMAKE_SOURCE_DIR)
    message(FATAL_ERROR "Please select another Build Directory ! (and give it a clever name, like bin_Visual2012_64bits/)")
endif ()
if (CMAKE_SOURCE_DIR MATCHES " ")
    message("Your Source Directory contains spaces. If you experience problems when compiling, this can be the cause.")
endif ()
if (CMAKE_BINARY_DIR MATCHES " ")
    message("Your Build Directory contains spaces. If you experience problems when compiling, this can be the cause.")
endif ()


# Compile external dependencies
add_subdirectory(external)
#add_subdirectory(external/assimp-master/)


# On Visual 2005 and above, this module can set the debug working directory
cmake_policy(SET CMP0026 OLD)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/external/rpavlik-cmake-modules-fe2273")
include(CreateLaunchers)
include(MSVCMultipleProcessCompile) # /MP

if (INCLUDE_DISTRIB)
    add_subdirectory(distrib)
endif (INCLUDE_DISTRIB)


include_directories(
        external/glfw-3.1.2/include/GLFW/
        external/glm-0.9.7.1/
        external/glew-1.13.0/include/
        #external/assimp-master/include/
        #libs/assimp-src/include/
        #F:/CLionProjects/3D-graphics/OpenGL-Template-master/libs/assimp-src/include
        #F:/CLionProjects/3D-graphics/OpenGL-Template-master/libs/assimp-build/include
        .
)


set(ALL_LIBS
        ${OPENGL_LIBRARY}
        glfw
        GLEW_1130
        )

add_definitions(
        -DTW_STATIC
        -DTW_NO_LIB_PRAGMA
        -DTW_NO_DIRECT3D
        -DGLEW_STATIC
        -D_CRT_SECURE_NO_WARNINGS
)

# User playground
add_executable(playground
        playground/playground.cpp
        playground/playground.h
        playground/SimpleFragmentShader.fragmentshader
        playground/SimpleVertexShader.vertexshader
        common/shader.cpp
        common/shader.hpp
        )
target_link_libraries(playground
        ${ALL_LIBS}
        )
# Xcode and Visual working directories
set_target_properties(playground PROPERTIES XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/playground/")
create_target_launcher(playground WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/playground/")

SOURCE_GROUP(common REGULAR_EXPRESSION ".*/common/.*")
SOURCE_GROUP(shaders REGULAR_EXPRESSION ".*/.*shader$")

if (NOT ${CMAKE_GENERATOR} MATCHES "Xcode")

    add_custom_command(
            TARGET playground POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/playground${CMAKE_EXECUTABLE_SUFFIX}" "${CMAKE_CURRENT_SOURCE_DIR}/playground/"
    )


elseif (${CMAKE_GENERATOR} MATCHES "Xcode")

endif (NOT ${CMAKE_GENERATOR} MATCHES "Xcode")


message("${Green}Start of ASSIMP Build${ColourReset}")

#https://stackoverflow.com/questions/73991892/what-is-the-best-way-to-add-assimp-to-a-cmake-project
#https://github.com/assimp/assimp/issues/1566


#test if files do acctualy exist :)
#taken from CmakeList from Software Project (origingal autor was me)
#if (EXISTS "${ASSIMP_LIBRARY_DIRS}")
#else ()
#    message(WARNING "Missing dependency ${ASSIMP_LIBRARY_DIRS}")
#endif ()
#
#if (EXISTS "${ASSIMP_INCLUDE_DIRS_assimp-build}")
#else ()
#    message(WARNING "Missing dependency ${ASSIMP_INCLUDE_DIRS_assimp-build}")
#endif ()
#if (EXISTS "${ASSIMP_INCLUDE_DIRS_assimp-src}")
#else ()
#    message(WARNING "Missing dependency ${ASSIMP_INCLUDE_DIRS_assimp-src}")
#endif ()

#set(ASSIMP_LIBRARY_DIRS "${PROJECT_SOURCE_DIR}/libs/assimp-build/code")
##set(ASSIMP_INCLUDE_DIRS_assimp-build "${PROJECT_SOURCE_DIR}/libs/assimp-build/include/")
##set(ASSIMP_INCLUDE_DIRS_assimp-src "${PROJECT_SOURCE_DIR}/libs/assimp-src/include/")
##
##include(FetchContent)
#set(FETCHCONTENT_BASE_DIR ${PROJECT_SOURCE_DIR}/libs CACHE PATH "Missing description." FORCE)
##FetchContent_Declare(assimp
##        GIT_REPOSITORY https://github.com/assimp/assimp.git
##        GIT_TAG master)
##
##set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
##set(ASSIMP_BUILD_TESTS OFF CACHE BOOL "" FORCE)
##set(ASSIMP_INJECT_DEBUG_POSTFIX OFF CACHE BOOL "" FORCE)
##set(ASSIMP_INSTALL OFF CACHE BOOL "" FORCE)
##FetchContent_MakeAvailable(assimp)
##
##target_include_directories(playground PRIVATE ${ASSIMP_INCLUDE_DIRS_assimp-build} ${ASSIMP_INCLUDE_DIRS_assimp-src})
##link_directories(${ASSIMP_LIBRARY_DIRS})
##


#include(FetchContent)

#set(ASSIMP_LIBRARY_DIRS "${PROJECT_SOURCE_DIR}/libs/assimp-build/code")
#set(ASSIMP_INCLUDE_DIRS_assimp-build "${PROJECT_SOURCE_DIR}/libs/assimp-build/include/")
#set(ASSIMP_INCLUDE_DIRS_assimp-src "${PROJECT_SOURCE_DIR}/libs/assimp-src/include/")
#set(FETCHCONTENT_BASE_DIR ${PROJECT_SOURCE_DIR}/libs CACHE PATH "Missing description." FORCE)

#FetchContent_Declare(assimp
#        GIT_REPOSITORY https://github.com/assimp/assimp.git
#        GIT_TAG master)

#FetchContent_MakeAvailable(assimp)
#include_directories(${FETCHCONTENT_BASE_DIR}/assimp/include)





#target_include_directories(playground PRIVATE
#        ${ASSIMP_INCLUDE_DIRS_assimp-build} ${ASSIMP_INCLUDE_DIRS_assimp-src})

#last comentet
#add_subdirectory(external/assimp-master/)
#target_link_libraries(playground assimp)
#
#set(ASSIMP_BUILD_TESTS OFF CACHE BOOL "" FORCE)
#set(ASSIMP_INJECT_DEBUG_POSTFIX OFF CACHE BOOL "" FORCE)
#set(ASSIMP_INSTALL OFF CACHE BOOL "" FORCE)
#set(BUILD_SHARED_LIBS ON)


#add_subdirectory(${PROJECT_SOURCE_DIR}/libs/assimp-src/)
#target_link_libraries(playground assimp)



#target_link_libraries(playground assimp)

#target_link_libraries(playground assimp::assimp)


if (ENABLE_VALIDATION)
    add_definitions(-DENABLE_VALIDATION=1)
endif (ENABLE_VALIDATION)

if (ENABLE_API_DUMP)
    add_definitions(-DENABLE_API_DUMP=1)
endif (ENABLE_API_DUMP)

if (assimp_FOUND)
    set(ASSIMP_LIBRARY "assimp")
    add_library(${ASSIMP_LIBRARY} SHARED IMPORTED)
    set_target_properties(${ASSIMP_LIBRARY} PROPERTIES IMPORTED_LOCATION "${ASSIMP_LIBRARY_DIRS}/libassimp.so")
endif(assimp_FOUND)



ADD_SUBDIRECTORY(external/assimp-master/)
set(BUILD_SHARED_LIBS ON)
TARGET_LINK_LIBRARIES(playground assimp)