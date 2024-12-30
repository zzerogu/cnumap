# Install script for directory: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/midgard

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/valhalla/midgard" TYPE FILE FILES
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/aabb2.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/constants.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/distanceapproximator.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/elevation_encoding.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/ellipse.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/encoded.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/gridded_data.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/linesegment2.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/logging.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/obb2.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/point2.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/point_tile_index.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/pointll.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/polyline2.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/sequence.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/tiles.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/util.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/util_core.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/midgard/vector2.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/midgard/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
