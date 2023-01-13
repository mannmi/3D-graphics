# Install script for directory: F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/OpenGL-Template")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "C:/Users/root/AppData/Local/JetBrains/Toolbox/apps/CLion/ch-0/222.4345.21/bin/mingw/bin/objdump.exe")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibassimp5.2.5-devx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/external/assimp-master/lib/libassimpd.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xassimp-devx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/assimp" TYPE FILE FILES
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/anim.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/aabb.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ai_assert.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/camera.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/color4.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/color4.inl"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/cmake-build-debug/external/assimp-master/code/../include/assimp/config.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ColladaMetaData.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/commonMetaData.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/defs.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/cfileio.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/light.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/material.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/material.inl"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/matrix3x3.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/matrix3x3.inl"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/matrix4x4.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/matrix4x4.inl"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/mesh.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ObjMaterial.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/pbrmaterial.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/GltfMaterial.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/postprocess.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/quaternion.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/quaternion.inl"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/scene.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/metadata.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/texture.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/types.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/vector2.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/vector2.inl"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/vector3.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/vector3.inl"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/version.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/cimport.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/AssertHandler.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/importerdesc.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Importer.hpp"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/DefaultLogger.hpp"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ProgressHandler.hpp"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/IOStream.hpp"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/IOSystem.hpp"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Logger.hpp"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/LogStream.hpp"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/NullLogger.hpp"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/cexport.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Exporter.hpp"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/DefaultIOStream.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/DefaultIOSystem.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ZipArchiveIOSystem.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SceneCombiner.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/fast_atof.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/qnan.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/BaseImporter.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Hash.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/MemoryIOWrapper.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ParsingUtils.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/StreamReader.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/StreamWriter.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/StringComparison.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/StringUtils.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SGSpatialSort.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/GenericProperty.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SpatialSort.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SkeletonMeshBuilder.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SmallVector.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SmoothingGroups.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/SmoothingGroups.inl"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/StandardShapes.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/RemoveComments.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Subdivision.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Vertex.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/LineSplitter.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/TinyFormatter.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Profiler.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/LogAux.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Bitmap.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/XMLTools.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/IOStreamBuffer.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/CreateAnimMesh.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/XmlParser.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/BlobIOSystem.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/MathFunctions.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Exceptional.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/ByteSwapper.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Base64.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xassimp-devx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/assimp/Compiler" TYPE FILE FILES
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Compiler/pushpack1.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Compiler/poppack1.h"
    "F:/CLionProjects/3D-graphics/OpenGL-Template-master/external/assimp-master/code/../include/assimp/Compiler/pstdint.h"
    )
endif()

