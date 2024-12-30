# Install script for directory: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/valhalla/meili" TYPE FILE FILES
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/candidate_search.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/config.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/emission_cost_model.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/geometry_helpers.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/grid_range_query.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/grid_traversal.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/map_matcher.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/map_matcher_factory.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/match_result.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/measurement.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/priority_queue.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/routing.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/state.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/stateid.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/topk_search.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/traffic_segment_matcher.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/transition_cost_model.h"
    "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/valhalla/meili/viterbi_search.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
