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

# Utility rule file for run-gurka_hard_exclusions_highways.

# Include any custom commands dependencies for this target.
include test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/compiler_depend.make

# Include the progress variables for this target.
include test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/progress.make

test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways: test/gurka/gurka_hard_exclusions_highways.log

test/gurka/gurka_hard_exclusions_highways.log: test/gurka/gurka_hard_exclusions_highways
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating gurka_hard_exclusions_highways.log"
	LOCPATH=/Users/yijungu/cnumap/backend/valhalla_server/valhalla/locales /bin/bash -c "/Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/gurka_hard_exclusions_highways >& /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/gurka_hard_exclusions_highways.log         && echo [PASS] gurka_hard_exclusions_highways         || ( exit=\$$? ;              echo [FAIL] gurka_hard_exclusions_highways ;              cat /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/gurka_hard_exclusions_highways.log ;              exit \$$exit )"

test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/codegen:
.PHONY : test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/codegen

run-gurka_hard_exclusions_highways: test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways
run-gurka_hard_exclusions_highways: test/gurka/gurka_hard_exclusions_highways.log
run-gurka_hard_exclusions_highways: test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/build.make
.PHONY : run-gurka_hard_exclusions_highways

# Rule to build all files generated by this target.
test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/build: run-gurka_hard_exclusions_highways
.PHONY : test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/build

test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/clean:
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka && $(CMAKE_COMMAND) -P CMakeFiles/run-gurka_hard_exclusions_highways.dir/cmake_clean.cmake
.PHONY : test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/clean

test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/depend:
	cd /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yijungu/cnumap/backend/valhalla_server/valhalla /Users/yijungu/cnumap/backend/valhalla_server/valhalla/test/gurka /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka /Users/yijungu/cnumap/backend/valhalla_server/valhalla/build/test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/gurka/CMakeFiles/run-gurka_hard_exclusions_highways.dir/depend

