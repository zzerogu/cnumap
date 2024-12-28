# Install script for directory: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/proto

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/valhalla/proto" TYPE FILE FILES
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//api.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//common.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//directions.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//info.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//options.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//sign.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//trip.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//transit.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//transit_fetch.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//incidents.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//status.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//matrix.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//isochrone.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//expansion.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//fileformat.pb.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto//osmformat.pb.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/valhalla/proto/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
