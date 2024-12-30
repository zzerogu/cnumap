# Install script for directory: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/mjolnir

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/valhalla/mjolnir" TYPE FILE FILES
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/admin.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/adminbuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/adminconstants.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/bssbuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/complexrestrictionbuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/convert_transit.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/countryaccess.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/dataquality.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/directededgebuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/edgeinfobuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/elevationbuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/ferry_connections.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/graphbuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/graphenhancer.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/graphfilter.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/graphtilebuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/graphvalidator.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/hierarchybuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/ingest_transit.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/landmarks.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/linkclassification.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/luatagtransform.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/node_expander.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/osmaccess.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/osmaccessrestriction.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/osmadmindata.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/osmdata.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/osmlinguistic.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/osmnode.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/osmnodelinguistic.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/osmpbfparser.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/osmrestriction.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/osmway.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/pbfadminparser.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/pbfgraphparser.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/restrictionbuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/servicedays.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/shortcutbuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/timeparsing.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/transitbuilder.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/uniquenames.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/util.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/mjolnir/validatetransit.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/mjolnir/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
