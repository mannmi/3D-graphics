# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "F:/CLionProjects/3D-graphics/OpenGL-Template-master/libs/assimp-src"
  "F:/CLionProjects/3D-graphics/OpenGL-Template-master/libs/assimp-build"
  "F:/CLionProjects/3D-graphics/OpenGL-Template-master/libs/assimp-subbuild/assimp-populate-prefix"
  "F:/CLionProjects/3D-graphics/OpenGL-Template-master/libs/assimp-subbuild/assimp-populate-prefix/tmp"
  "F:/CLionProjects/3D-graphics/OpenGL-Template-master/libs/assimp-subbuild/assimp-populate-prefix/src/assimp-populate-stamp"
  "F:/CLionProjects/3D-graphics/OpenGL-Template-master/libs/assimp-subbuild/assimp-populate-prefix/src"
  "F:/CLionProjects/3D-graphics/OpenGL-Template-master/libs/assimp-subbuild/assimp-populate-prefix/src/assimp-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "F:/CLionProjects/3D-graphics/OpenGL-Template-master/libs/assimp-subbuild/assimp-populate-prefix/src/assimp-populate-stamp/${subDir}")
endforeach()
