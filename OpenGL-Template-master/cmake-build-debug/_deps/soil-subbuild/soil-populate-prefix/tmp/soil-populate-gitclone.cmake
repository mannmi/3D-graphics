# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

if(EXISTS "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp/soil-populate-gitclone-lastrun.txt" AND EXISTS "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp/soil-populate-gitinfo.txt" AND
  "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp/soil-populate-gitclone-lastrun.txt" IS_NEWER_THAN "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp/soil-populate-gitinfo.txt")
  message(STATUS
    "Avoiding repeated git clone, stamp file is up to date: "
    "'/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp/soil-populate-gitclone-lastrun.txt'"
  )
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git" 
            clone --no-checkout --config "advice.detachedHead=false" "https://github.com/littlstar/soil.git" "soil-src"
    WORKING_DIRECTORY "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps"
    RESULT_VARIABLE error_code
  )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once: ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/littlstar/soil.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git" 
          checkout "master" --
  WORKING_DIRECTORY "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'master'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git" 
            submodule update --recursive --init 
    WORKING_DIRECTORY "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-src"
    RESULT_VARIABLE error_code
  )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp/soil-populate-gitinfo.txt" "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp/soil-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp/soil-populate-gitclone-lastrun.txt'")
endif()
