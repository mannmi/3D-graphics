# Install script for directory: /home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibassimp5.2.5-devx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/external/assimp-master/lib/libassimpd.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xassimp-devx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/assimp" TYPE FILE FILES
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/anim.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/aabb.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ai_assert.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/camera.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/color4.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/color4.inl"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/external/assimp-master/code/../include/assimp/config.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ColladaMetaData.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/commonMetaData.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/defs.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/cfileio.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/light.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/material.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/material.inl"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/matrix3x3.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/matrix3x3.inl"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/matrix4x4.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/matrix4x4.inl"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/mesh.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ObjMaterial.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/pbrmaterial.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/GltfMaterial.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/postprocess.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/quaternion.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/quaternion.inl"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/scene.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/metadata.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/texture.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/types.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/vector2.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/vector2.inl"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/vector3.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/vector3.inl"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/version.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/cimport.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/AssertHandler.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/importerdesc.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Importer.hpp"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/DefaultLogger.hpp"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ProgressHandler.hpp"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/IOStream.hpp"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/IOSystem.hpp"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Logger.hpp"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/LogStream.hpp"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/NullLogger.hpp"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/cexport.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Exporter.hpp"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/DefaultIOStream.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/DefaultIOSystem.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ZipArchiveIOSystem.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SceneCombiner.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/fast_atof.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/qnan.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/BaseImporter.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Hash.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/MemoryIOWrapper.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ParsingUtils.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/StreamReader.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/StreamWriter.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/StringComparison.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/StringUtils.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SGSpatialSort.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/GenericProperty.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SpatialSort.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SkeletonMeshBuilder.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SmallVector.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SmoothingGroups.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SmoothingGroups.inl"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/StandardShapes.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/RemoveComments.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Subdivision.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Vertex.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/LineSplitter.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/TinyFormatter.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Profiler.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/LogAux.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Bitmap.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/XMLTools.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/IOStreamBuffer.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/CreateAnimMesh.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/XmlParser.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/BlobIOSystem.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/MathFunctions.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Exceptional.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ByteSwapper.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Base64.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xassimp-devx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/assimp/Compiler" TYPE FILE FILES
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Compiler/pushpack1.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Compiler/poppack1.h"
    "/home/mannmi/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Compiler/pstdint.h"
    )
endif()

