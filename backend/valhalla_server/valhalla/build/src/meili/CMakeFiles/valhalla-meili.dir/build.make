# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/yijungu/cnumap/backend/valhalla_server/valhalla

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build

# Include any dependencies generated for this target.
include src/meili/CMakeFiles/valhalla-meili.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.make

# Include the progress variables for this target.
include src/meili/CMakeFiles/valhalla-meili.dir/progress.make

# Include the compile flags for this target's objects.
include src/meili/CMakeFiles/valhalla-meili.dir/flags.make

src/meili/CMakeFiles/valhalla-meili.dir/codegen:
.PHONY : src/meili/CMakeFiles/valhalla-meili.dir/codegen

src/meili/CMakeFiles/valhalla-meili.dir/topk_search.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/flags.make
src/meili/CMakeFiles/valhalla-meili.dir/topk_search.cc.o: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/topk_search.cc
src/meili/CMakeFiles/valhalla-meili.dir/topk_search.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/meili/CMakeFiles/valhalla-meili.dir/topk_search.cc.o"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -MD -MT src/meili/CMakeFiles/valhalla-meili.dir/topk_search.cc.o -MF CMakeFiles/valhalla-meili.dir/topk_search.cc.o.d -o CMakeFiles/valhalla-meili.dir/topk_search.cc.o -c /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/topk_search.cc

src/meili/CMakeFiles/valhalla-meili.dir/topk_search.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/valhalla-meili.dir/topk_search.cc.i"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -E /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/topk_search.cc > CMakeFiles/valhalla-meili.dir/topk_search.cc.i

src/meili/CMakeFiles/valhalla-meili.dir/topk_search.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/valhalla-meili.dir/topk_search.cc.s"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -S /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/topk_search.cc -o CMakeFiles/valhalla-meili.dir/topk_search.cc.s

src/meili/CMakeFiles/valhalla-meili.dir/routing.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/flags.make
src/meili/CMakeFiles/valhalla-meili.dir/routing.cc.o: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/routing.cc
src/meili/CMakeFiles/valhalla-meili.dir/routing.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/meili/CMakeFiles/valhalla-meili.dir/routing.cc.o"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -MD -MT src/meili/CMakeFiles/valhalla-meili.dir/routing.cc.o -MF CMakeFiles/valhalla-meili.dir/routing.cc.o.d -o CMakeFiles/valhalla-meili.dir/routing.cc.o -c /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/routing.cc

src/meili/CMakeFiles/valhalla-meili.dir/routing.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/valhalla-meili.dir/routing.cc.i"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -E /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/routing.cc > CMakeFiles/valhalla-meili.dir/routing.cc.i

src/meili/CMakeFiles/valhalla-meili.dir/routing.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/valhalla-meili.dir/routing.cc.s"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -S /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/routing.cc -o CMakeFiles/valhalla-meili.dir/routing.cc.s

src/meili/CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/flags.make
src/meili/CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.o: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/geometry_helpers.cc
src/meili/CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/meili/CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.o"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -MD -MT src/meili/CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.o -MF CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.o.d -o CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.o -c /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/geometry_helpers.cc

src/meili/CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.i"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -E /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/geometry_helpers.cc > CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.i

src/meili/CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.s"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -S /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/geometry_helpers.cc -o CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.s

src/meili/CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/flags.make
src/meili/CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.o: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/map_matcher_factory.cc
src/meili/CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/meili/CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.o"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -MD -MT src/meili/CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.o -MF CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.o.d -o CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.o -c /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/map_matcher_factory.cc

src/meili/CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.i"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -E /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/map_matcher_factory.cc > CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.i

src/meili/CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.s"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -S /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/map_matcher_factory.cc -o CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.s

src/meili/CMakeFiles/valhalla-meili.dir/config.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/flags.make
src/meili/CMakeFiles/valhalla-meili.dir/config.cc.o: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/config.cc
src/meili/CMakeFiles/valhalla-meili.dir/config.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/meili/CMakeFiles/valhalla-meili.dir/config.cc.o"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -MD -MT src/meili/CMakeFiles/valhalla-meili.dir/config.cc.o -MF CMakeFiles/valhalla-meili.dir/config.cc.o.d -o CMakeFiles/valhalla-meili.dir/config.cc.o -c /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/config.cc

src/meili/CMakeFiles/valhalla-meili.dir/config.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/valhalla-meili.dir/config.cc.i"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -E /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/config.cc > CMakeFiles/valhalla-meili.dir/config.cc.i

src/meili/CMakeFiles/valhalla-meili.dir/config.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/valhalla-meili.dir/config.cc.s"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Werror -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -S /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/config.cc -o CMakeFiles/valhalla-meili.dir/config.cc.s

src/meili/CMakeFiles/valhalla-meili.dir/candidate_search.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/flags.make
src/meili/CMakeFiles/valhalla-meili.dir/candidate_search.cc.o: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/candidate_search.cc
src/meili/CMakeFiles/valhalla-meili.dir/candidate_search.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/meili/CMakeFiles/valhalla-meili.dir/candidate_search.cc.o"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/meili/CMakeFiles/valhalla-meili.dir/candidate_search.cc.o -MF CMakeFiles/valhalla-meili.dir/candidate_search.cc.o.d -o CMakeFiles/valhalla-meili.dir/candidate_search.cc.o -c /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/candidate_search.cc

src/meili/CMakeFiles/valhalla-meili.dir/candidate_search.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/valhalla-meili.dir/candidate_search.cc.i"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/candidate_search.cc > CMakeFiles/valhalla-meili.dir/candidate_search.cc.i

src/meili/CMakeFiles/valhalla-meili.dir/candidate_search.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/valhalla-meili.dir/candidate_search.cc.s"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/candidate_search.cc -o CMakeFiles/valhalla-meili.dir/candidate_search.cc.s

src/meili/CMakeFiles/valhalla-meili.dir/map_matcher.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/flags.make
src/meili/CMakeFiles/valhalla-meili.dir/map_matcher.cc.o: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/map_matcher.cc
src/meili/CMakeFiles/valhalla-meili.dir/map_matcher.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/meili/CMakeFiles/valhalla-meili.dir/map_matcher.cc.o"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/meili/CMakeFiles/valhalla-meili.dir/map_matcher.cc.o -MF CMakeFiles/valhalla-meili.dir/map_matcher.cc.o.d -o CMakeFiles/valhalla-meili.dir/map_matcher.cc.o -c /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/map_matcher.cc

src/meili/CMakeFiles/valhalla-meili.dir/map_matcher.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/valhalla-meili.dir/map_matcher.cc.i"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/map_matcher.cc > CMakeFiles/valhalla-meili.dir/map_matcher.cc.i

src/meili/CMakeFiles/valhalla-meili.dir/map_matcher.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/valhalla-meili.dir/map_matcher.cc.s"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/map_matcher.cc -o CMakeFiles/valhalla-meili.dir/map_matcher.cc.s

src/meili/CMakeFiles/valhalla-meili.dir/match_route.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/flags.make
src/meili/CMakeFiles/valhalla-meili.dir/match_route.cc.o: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/match_route.cc
src/meili/CMakeFiles/valhalla-meili.dir/match_route.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/meili/CMakeFiles/valhalla-meili.dir/match_route.cc.o"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/meili/CMakeFiles/valhalla-meili.dir/match_route.cc.o -MF CMakeFiles/valhalla-meili.dir/match_route.cc.o.d -o CMakeFiles/valhalla-meili.dir/match_route.cc.o -c /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/match_route.cc

src/meili/CMakeFiles/valhalla-meili.dir/match_route.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/valhalla-meili.dir/match_route.cc.i"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/match_route.cc > CMakeFiles/valhalla-meili.dir/match_route.cc.i

src/meili/CMakeFiles/valhalla-meili.dir/match_route.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/valhalla-meili.dir/match_route.cc.s"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/match_route.cc -o CMakeFiles/valhalla-meili.dir/match_route.cc.s

src/meili/CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/flags.make
src/meili/CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.o: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/transition_cost_model.cc
src/meili/CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/meili/CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.o"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/meili/CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.o -MF CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.o.d -o CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.o -c /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/transition_cost_model.cc

src/meili/CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.i"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/transition_cost_model.cc > CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.i

src/meili/CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.s"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/transition_cost_model.cc -o CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.s

src/meili/CMakeFiles/valhalla-meili.dir/viterbi_search.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/flags.make
src/meili/CMakeFiles/valhalla-meili.dir/viterbi_search.cc.o: /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/viterbi_search.cc
src/meili/CMakeFiles/valhalla-meili.dir/viterbi_search.cc.o: src/meili/CMakeFiles/valhalla-meili.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/meili/CMakeFiles/valhalla-meili.dir/viterbi_search.cc.o"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/meili/CMakeFiles/valhalla-meili.dir/viterbi_search.cc.o -MF CMakeFiles/valhalla-meili.dir/viterbi_search.cc.o.d -o CMakeFiles/valhalla-meili.dir/viterbi_search.cc.o -c /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/viterbi_search.cc

src/meili/CMakeFiles/valhalla-meili.dir/viterbi_search.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/valhalla-meili.dir/viterbi_search.cc.i"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/viterbi_search.cc > CMakeFiles/valhalla-meili.dir/viterbi_search.cc.i

src/meili/CMakeFiles/valhalla-meili.dir/viterbi_search.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/valhalla-meili.dir/viterbi_search.cc.s"
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili/viterbi_search.cc -o CMakeFiles/valhalla-meili.dir/viterbi_search.cc.s

valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/topk_search.cc.o
valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/routing.cc.o
valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/geometry_helpers.cc.o
valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/map_matcher_factory.cc.o
valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/config.cc.o
valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/candidate_search.cc.o
valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/map_matcher.cc.o
valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/match_route.cc.o
valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/transition_cost_model.cc.o
valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/viterbi_search.cc.o
valhalla-meili: src/meili/CMakeFiles/valhalla-meili.dir/build.make
.PHONY : valhalla-meili

# Rule to build all files generated by this target.
src/meili/CMakeFiles/valhalla-meili.dir/build: valhalla-meili
.PHONY : src/meili/CMakeFiles/valhalla-meili.dir/build

src/meili/CMakeFiles/valhalla-meili.dir/clean:
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili && $(CMAKE_COMMAND) -P CMakeFiles/valhalla-meili.dir/cmake_clean.cmake
.PHONY : src/meili/CMakeFiles/valhalla-meili.dir/clean

src/meili/CMakeFiles/valhalla-meili.dir/depend:
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yijungu/cnumap/backend/valhalla_server/valhalla /Users/yijungu/cnumap/backend/valhalla_server/valhalla/src/meili /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/src/meili/CMakeFiles/valhalla-meili.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/meili/CMakeFiles/valhalla-meili.dir/depend

