# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-src"
  "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-build"
  "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix"
  "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/tmp"
  "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp"
  "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src"
  "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/_deps/soil-subbuild/soil-populate-prefix/src/soil-populate-stamp/${subDir}")
endforeach()
