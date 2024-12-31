# Install script for directory: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/sif

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/valhalla/sif" TYPE FILE FILES
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/autocost.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/bicyclecost.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/costconstants.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/costfactory.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/dynamiccost.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/edgelabel.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/hierarchylimits.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/motorcyclecost.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/motorscootercost.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/nocost.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/osrm_car_duration.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/pedestriancost.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/recost.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/transitcost.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/truckcost.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/sif/wheelchair_cost.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/sif/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
