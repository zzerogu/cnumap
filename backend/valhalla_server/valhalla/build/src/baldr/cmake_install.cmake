# Install script for directory: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/baldr

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/valhalla/baldr" TYPE FILE FILES
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/accessrestriction.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/admin.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/admininfo.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/attributes_controller.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/complexrestriction.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/compression_utils.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/conditional_speed_limit.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/connectivity_map.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/curl_tilegetter.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/curler.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/datetime.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/directededge.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/double_bucket_queue.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/edgeinfo.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/edgetracker.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/graphconstants.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/graphid.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/graphmemory.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/graphreader.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/graphtile.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/graphtileheader.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/graphtileptr.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/json.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/landmark.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/laneconnectivity.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/location.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/merge.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/nodeinfo.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/nodetransition.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/openlr.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/pathlocation.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/predictedspeeds.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/rapidjson_utils.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/sign.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/signinfo.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/streetname.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/streetname_us.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/streetnames.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/streetnames_factory.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/streetnames_us.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/tilegetter.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/tilehierarchy.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/time_info.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/timedomain.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/traffictile.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/transitdeparture.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/transitroute.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/transitschedule.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/transitstop.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/transittransfer.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/turn.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/turnlanes.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/verbal_text_formatter.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/verbal_text_formatter_factory.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/verbal_text_formatter_us.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/verbal_text_formatter_us_co.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/baldr/verbal_text_formatter_us_tx.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/baldr/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
