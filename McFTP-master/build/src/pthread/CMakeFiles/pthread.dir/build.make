# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/es/Desktop/test_MiL/McFTP-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/es/Desktop/test_MiL/McFTP-master/build

# Include any dependencies generated for this target.
include src/pthread/CMakeFiles/pthread.dir/depend.make

# Include the progress variables for this target.
include src/pthread/CMakeFiles/pthread.dir/progress.make

# Include the compile flags for this target's objects.
include src/pthread/CMakeFiles/pthread.dir/flags.make

src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o: src/pthread/CMakeFiles/pthread.dir/flags.make
src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o: ../src/pthread/Priorities.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pthread.dir/Priorities.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/pthread/Priorities.cpp

src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pthread.dir/Priorities.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/pthread/Priorities.cpp > CMakeFiles/pthread.dir/Priorities.cpp.i

src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pthread.dir/Priorities.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/pthread/Priorities.cpp -o CMakeFiles/pthread.dir/Priorities.cpp.s

src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o.requires:

.PHONY : src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o.requires

src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o.provides: src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o.requires
	$(MAKE) -f src/pthread/CMakeFiles/pthread.dir/build.make src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o.provides.build
.PHONY : src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o.provides

src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o.provides.build: src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o


src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o: src/pthread/CMakeFiles/pthread.dir/flags.make
src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o: ../src/pthread/Thread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pthread.dir/Thread.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/pthread/Thread.cpp

src/pthread/CMakeFiles/pthread.dir/Thread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pthread.dir/Thread.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/pthread/Thread.cpp > CMakeFiles/pthread.dir/Thread.cpp.i

src/pthread/CMakeFiles/pthread.dir/Thread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pthread.dir/Thread.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/pthread/Thread.cpp -o CMakeFiles/pthread.dir/Thread.cpp.s

src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o.requires:

.PHONY : src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o.requires

src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o.provides: src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o.requires
	$(MAKE) -f src/pthread/CMakeFiles/pthread.dir/build.make src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o.provides.build
.PHONY : src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o.provides

src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o.provides.build: src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o


# Object files for target pthread
pthread_OBJECTS = \
"CMakeFiles/pthread.dir/Priorities.cpp.o" \
"CMakeFiles/pthread.dir/Thread.cpp.o"

# External object files for target pthread
pthread_EXTERNAL_OBJECTS =

src/pthread/libpthread.a: src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o
src/pthread/libpthread.a: src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o
src/pthread/libpthread.a: src/pthread/CMakeFiles/pthread.dir/build.make
src/pthread/libpthread.a: src/pthread/CMakeFiles/pthread.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libpthread.a"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread && $(CMAKE_COMMAND) -P CMakeFiles/pthread.dir/cmake_clean_target.cmake
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pthread.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/pthread/CMakeFiles/pthread.dir/build: src/pthread/libpthread.a

.PHONY : src/pthread/CMakeFiles/pthread.dir/build

src/pthread/CMakeFiles/pthread.dir/requires: src/pthread/CMakeFiles/pthread.dir/Priorities.cpp.o.requires
src/pthread/CMakeFiles/pthread.dir/requires: src/pthread/CMakeFiles/pthread.dir/Thread.cpp.o.requires

.PHONY : src/pthread/CMakeFiles/pthread.dir/requires

src/pthread/CMakeFiles/pthread.dir/clean:
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread && $(CMAKE_COMMAND) -P CMakeFiles/pthread.dir/cmake_clean.cmake
.PHONY : src/pthread/CMakeFiles/pthread.dir/clean

src/pthread/CMakeFiles/pthread.dir/depend:
	cd /home/es/Desktop/test_MiL/McFTP-master/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/es/Desktop/test_MiL/McFTP-master /home/es/Desktop/test_MiL/McFTP-master/src/pthread /home/es/Desktop/test_MiL/McFTP-master/build /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread /home/es/Desktop/test_MiL/McFTP-master/build/src/pthread/CMakeFiles/pthread.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/pthread/CMakeFiles/pthread.dir/depend

