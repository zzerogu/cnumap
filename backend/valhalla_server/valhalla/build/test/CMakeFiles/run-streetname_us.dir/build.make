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

# Utility rule file for run-streetname_us.

# Include any custom commands dependencies for this target.
include test/CMakeFiles/run-streetname_us.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/run-streetname_us.dir/progress.make

test/CMakeFiles/run-streetname_us: test/streetname_us.log

test/streetname_us.log: test/streetname_us
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating streetname_us.log"
	LOCPATH=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/locales /bin/bash -c "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/streetname_us >& /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/streetname_us.log       && echo [PASS] streetname_us       || ( exit=\$$? ;            echo [FAIL] streetname_us ;            cat /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/streetname_us.log ;            exit \$$exit )"

test/CMakeFiles/run-streetname_us.dir/codegen:
.PHONY : test/CMakeFiles/run-streetname_us.dir/codegen

run-streetname_us: test/CMakeFiles/run-streetname_us
run-streetname_us: test/streetname_us.log
run-streetname_us: test/CMakeFiles/run-streetname_us.dir/build.make
.PHONY : run-streetname_us

# Rule to build all files generated by this target.
test/CMakeFiles/run-streetname_us.dir/build: run-streetname_us
.PHONY : test/CMakeFiles/run-streetname_us.dir/build

test/CMakeFiles/run-streetname_us.dir/clean:
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test && $(CMAKE_COMMAND) -P CMakeFiles/run-streetname_us.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/run-streetname_us.dir/clean

test/CMakeFiles/run-streetname_us.dir/depend:
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yijungu/cnumap/backend/valhalla_server/valhalla /Users/yijungu/cnumap/backend/valhalla_server/valhalla/test /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/CMakeFiles/run-streetname_us.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/run-streetname_us.dir/depend

