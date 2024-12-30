# Install script for directory: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/thor

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
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/valhalla/thor" TYPE FILE FILES
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/alternates.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/astar_bss.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/astarheuristic.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/bidirectional_astar.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/centroid.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/costmatrix.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/dijkstras.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/edgestatus.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/isochrone.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/map_matcher.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/matrixalgorithm.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/multimodal.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/optimizer.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/pathalgorithm.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/pathinfo.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/route_matcher.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/timedistancebssmatrix.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/timedistancematrix.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/triplegbuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/unidirectional_astar.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/thor/worker.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/thor/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
