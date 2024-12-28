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

# Utility rule file for run-gurka_not_thru_pruning.

# Include any custom commands dependencies for this target.
include test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/compiler_depend.make

# Include the progress variables for this target.
include test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/progress.make

test/gurka/CMakeFiles/run-gurka_not_thru_pruning: test/gurka/gurka_not_thru_pruning.log

test/gurka/gurka_not_thru_pruning.log: test/gurka/gurka_not_thru_pruning
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating gurka_not_thru_pruning.log"
	LOCPATH=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/locales /bin/bash -c "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/gurka_not_thru_pruning >& /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/gurka_not_thru_pruning.log         && echo [PASS] gurka_not_thru_pruning         || ( exit=\$$? ;              echo [FAIL] gurka_not_thru_pruning ;              cat /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/gurka_not_thru_pruning.log ;              exit \$$exit )"

test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/codegen:
.PHONY : test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/codegen

run-gurka_not_thru_pruning: test/gurka/CMakeFiles/run-gurka_not_thru_pruning
run-gurka_not_thru_pruning: test/gurka/gurka_not_thru_pruning.log
run-gurka_not_thru_pruning: test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/build.make
.PHONY : run-gurka_not_thru_pruning

# Rule to build all files generated by this target.
test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/build: run-gurka_not_thru_pruning
.PHONY : test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/build

test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/clean:
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka && $(CMAKE_COMMAND) -P CMakeFiles/run-gurka_not_thru_pruning.dir/cmake_clean.cmake
.PHONY : test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/clean

test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/depend:
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yijungu/cnumap/backend/valhalla_server/valhalla /Users/yijungu/cnumap/backend/valhalla_server/valhalla/test/gurka /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/gurka/CMakeFiles/run-gurka_not_thru_pruning.dir/depend
