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

# Utility rule file for run-gurka_node_type.

# Include any custom commands dependencies for this target.
include test/gurka/CMakeFiles/run-gurka_node_type.dir/compiler_depend.make

# Include the progress variables for this target.
include test/gurka/CMakeFiles/run-gurka_node_type.dir/progress.make

test/gurka/CMakeFiles/run-gurka_node_type: test/gurka/gurka_node_type.log

test/gurka/gurka_node_type.log: test/gurka/gurka_node_type
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating gurka_node_type.log"
	LOCPATH=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/locales /bin/bash -c "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/gurka_node_type >& /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/gurka_node_type.log         && echo [PASS] gurka_node_type         || ( exit=\$$? ;              echo [FAIL] gurka_node_type ;              cat /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/gurka_node_type.log ;              exit \$$exit )"

test/gurka/CMakeFiles/run-gurka_node_type.dir/codegen:
.PHONY : test/gurka/CMakeFiles/run-gurka_node_type.dir/codegen

run-gurka_node_type: test/gurka/CMakeFiles/run-gurka_node_type
run-gurka_node_type: test/gurka/gurka_node_type.log
run-gurka_node_type: test/gurka/CMakeFiles/run-gurka_node_type.dir/build.make
.PHONY : run-gurka_node_type

# Rule to build all files generated by this target.
test/gurka/CMakeFiles/run-gurka_node_type.dir/build: run-gurka_node_type
.PHONY : test/gurka/CMakeFiles/run-gurka_node_type.dir/build

test/gurka/CMakeFiles/run-gurka_node_type.dir/clean:
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka && $(CMAKE_COMMAND) -P CMakeFiles/run-gurka_node_type.dir/cmake_clean.cmake
.PHONY : test/gurka/CMakeFiles/run-gurka_node_type.dir/clean

test/gurka/CMakeFiles/run-gurka_node_type.dir/depend:
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yijungu/cnumap/backend/valhalla_server/valhalla /Users/yijungu/cnumap/backend/valhalla_server/valhalla/test/gurka /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/CMakeFiles/run-gurka_node_type.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/gurka/CMakeFiles/run-gurka_node_type.dir/depend
