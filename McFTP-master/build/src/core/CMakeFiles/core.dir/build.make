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
include src/core/CMakeFiles/core.dir/depend.make

# Include the progress variables for this target.
include src/core/CMakeFiles/core.dir/progress.make

# Include the compile flags for this target's objects.
include src/core/CMakeFiles/core.dir/flags.make

src/core/CMakeFiles/core.dir/TempWatcher.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/TempWatcher.cpp.o: ../src/core/TempWatcher.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/core/CMakeFiles/core.dir/TempWatcher.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/TempWatcher.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/TempWatcher.cpp

src/core/CMakeFiles/core.dir/TempWatcher.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/TempWatcher.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/TempWatcher.cpp > CMakeFiles/core.dir/TempWatcher.cpp.i

src/core/CMakeFiles/core.dir/TempWatcher.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/TempWatcher.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/TempWatcher.cpp -o CMakeFiles/core.dir/TempWatcher.cpp.s

src/core/CMakeFiles/core.dir/TempWatcher.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/TempWatcher.cpp.o.requires

src/core/CMakeFiles/core.dir/TempWatcher.cpp.o.provides: src/core/CMakeFiles/core.dir/TempWatcher.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/TempWatcher.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/TempWatcher.cpp.o.provides

src/core/CMakeFiles/core.dir/TempWatcher.cpp.o.provides.build: src/core/CMakeFiles/core.dir/TempWatcher.cpp.o


src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o: ../src/core/ExecutionInterrupter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/ExecutionInterrupter.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/ExecutionInterrupter.cpp

src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/ExecutionInterrupter.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/ExecutionInterrupter.cpp > CMakeFiles/core.dir/ExecutionInterrupter.cpp.i

src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/ExecutionInterrupter.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/ExecutionInterrupter.cpp -o CMakeFiles/core.dir/ExecutionInterrupter.cpp.s

src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o.requires

src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o.provides: src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o.provides

src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o.provides.build: src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o


src/core/CMakeFiles/core.dir/Worker.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/Worker.cpp.o: ../src/core/Worker.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/core/CMakeFiles/core.dir/Worker.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/Worker.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/Worker.cpp

src/core/CMakeFiles/core.dir/Worker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/Worker.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/Worker.cpp > CMakeFiles/core.dir/Worker.cpp.i

src/core/CMakeFiles/core.dir/Worker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/Worker.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/Worker.cpp -o CMakeFiles/core.dir/Worker.cpp.s

src/core/CMakeFiles/core.dir/Worker.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/Worker.cpp.o.requires

src/core/CMakeFiles/core.dir/Worker.cpp.o.provides: src/core/CMakeFiles/core.dir/Worker.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/Worker.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/Worker.cpp.o.provides

src/core/CMakeFiles/core.dir/Worker.cpp.o.provides.build: src/core/CMakeFiles/core.dir/Worker.cpp.o


src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o: ../src/core/ComponentsDefine.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/ComponentsDefine.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/ComponentsDefine.cpp

src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/ComponentsDefine.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/ComponentsDefine.cpp > CMakeFiles/core.dir/ComponentsDefine.cpp.i

src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/ComponentsDefine.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/ComponentsDefine.cpp -o CMakeFiles/core.dir/ComponentsDefine.cpp.s

src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o.requires

src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o.provides: src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o.provides

src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o.provides.build: src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o


src/core/CMakeFiles/core.dir/TaskLoad.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/TaskLoad.cpp.o: ../src/core/TaskLoad.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/core/CMakeFiles/core.dir/TaskLoad.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/TaskLoad.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/TaskLoad.cpp

src/core/CMakeFiles/core.dir/TaskLoad.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/TaskLoad.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/TaskLoad.cpp > CMakeFiles/core.dir/TaskLoad.cpp.i

src/core/CMakeFiles/core.dir/TaskLoad.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/TaskLoad.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/TaskLoad.cpp -o CMakeFiles/core.dir/TaskLoad.cpp.s

src/core/CMakeFiles/core.dir/TaskLoad.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/TaskLoad.cpp.o.requires

src/core/CMakeFiles/core.dir/TaskLoad.cpp.o.provides: src/core/CMakeFiles/core.dir/TaskLoad.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/TaskLoad.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/TaskLoad.cpp.o.provides

src/core/CMakeFiles/core.dir/TaskLoad.cpp.o.provides.build: src/core/CMakeFiles/core.dir/TaskLoad.cpp.o


src/core/CMakeFiles/core.dir/structdef.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/structdef.cpp.o: ../src/core/structdef.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/core/CMakeFiles/core.dir/structdef.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/structdef.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/structdef.cpp

src/core/CMakeFiles/core.dir/structdef.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/structdef.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/structdef.cpp > CMakeFiles/core.dir/structdef.cpp.i

src/core/CMakeFiles/core.dir/structdef.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/structdef.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/structdef.cpp -o CMakeFiles/core.dir/structdef.cpp.s

src/core/CMakeFiles/core.dir/structdef.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/structdef.cpp.o.requires

src/core/CMakeFiles/core.dir/structdef.cpp.o.provides: src/core/CMakeFiles/core.dir/structdef.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/structdef.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/structdef.cpp.o.provides

src/core/CMakeFiles/core.dir/structdef.cpp.o.provides.build: src/core/CMakeFiles/core.dir/structdef.cpp.o


src/core/CMakeFiles/core.dir/PowerManager.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/PowerManager.cpp.o: ../src/core/PowerManager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/core/CMakeFiles/core.dir/PowerManager.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/PowerManager.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/PowerManager.cpp

src/core/CMakeFiles/core.dir/PowerManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/PowerManager.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/PowerManager.cpp > CMakeFiles/core.dir/PowerManager.cpp.i

src/core/CMakeFiles/core.dir/PowerManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/PowerManager.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/PowerManager.cpp -o CMakeFiles/core.dir/PowerManager.cpp.s

src/core/CMakeFiles/core.dir/PowerManager.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/PowerManager.cpp.o.requires

src/core/CMakeFiles/core.dir/PowerManager.cpp.o.provides: src/core/CMakeFiles/core.dir/PowerManager.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/PowerManager.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/PowerManager.cpp.o.provides

src/core/CMakeFiles/core.dir/PowerManager.cpp.o.provides.build: src/core/CMakeFiles/core.dir/PowerManager.cpp.o


src/core/CMakeFiles/core.dir/Dispatcher.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/Dispatcher.cpp.o: ../src/core/Dispatcher.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/core/CMakeFiles/core.dir/Dispatcher.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/Dispatcher.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/Dispatcher.cpp

src/core/CMakeFiles/core.dir/Dispatcher.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/Dispatcher.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/Dispatcher.cpp > CMakeFiles/core.dir/Dispatcher.cpp.i

src/core/CMakeFiles/core.dir/Dispatcher.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/Dispatcher.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/Dispatcher.cpp -o CMakeFiles/core.dir/Dispatcher.cpp.s

src/core/CMakeFiles/core.dir/Dispatcher.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/Dispatcher.cpp.o.requires

src/core/CMakeFiles/core.dir/Dispatcher.cpp.o.provides: src/core/CMakeFiles/core.dir/Dispatcher.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/Dispatcher.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/Dispatcher.cpp.o.provides

src/core/CMakeFiles/core.dir/Dispatcher.cpp.o.provides.build: src/core/CMakeFiles/core.dir/Dispatcher.cpp.o


src/core/CMakeFiles/core.dir/Task.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/Task.cpp.o: ../src/core/Task.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/core/CMakeFiles/core.dir/Task.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/Task.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/Task.cpp

src/core/CMakeFiles/core.dir/Task.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/Task.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/Task.cpp > CMakeFiles/core.dir/Task.cpp.i

src/core/CMakeFiles/core.dir/Task.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/Task.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/Task.cpp -o CMakeFiles/core.dir/Task.cpp.s

src/core/CMakeFiles/core.dir/Task.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/Task.cpp.o.requires

src/core/CMakeFiles/core.dir/Task.cpp.o.provides: src/core/CMakeFiles/core.dir/Task.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/Task.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/Task.cpp.o.provides

src/core/CMakeFiles/core.dir/Task.cpp.o.provides.build: src/core/CMakeFiles/core.dir/Task.cpp.o


src/core/CMakeFiles/core.dir/TaskArgument.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/TaskArgument.cpp.o: ../src/core/TaskArgument.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/core/CMakeFiles/core.dir/TaskArgument.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/TaskArgument.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/TaskArgument.cpp

src/core/CMakeFiles/core.dir/TaskArgument.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/TaskArgument.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/TaskArgument.cpp > CMakeFiles/core.dir/TaskArgument.cpp.i

src/core/CMakeFiles/core.dir/TaskArgument.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/TaskArgument.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/TaskArgument.cpp -o CMakeFiles/core.dir/TaskArgument.cpp.s

src/core/CMakeFiles/core.dir/TaskArgument.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/TaskArgument.cpp.o.requires

src/core/CMakeFiles/core.dir/TaskArgument.cpp.o.provides: src/core/CMakeFiles/core.dir/TaskArgument.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/TaskArgument.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/TaskArgument.cpp.o.provides

src/core/CMakeFiles/core.dir/TaskArgument.cpp.o.provides.build: src/core/CMakeFiles/core.dir/TaskArgument.cpp.o


src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o: ../src/core/ThermalApproach.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/ThermalApproach.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/ThermalApproach.cpp

src/core/CMakeFiles/core.dir/ThermalApproach.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/ThermalApproach.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/ThermalApproach.cpp > CMakeFiles/core.dir/ThermalApproach.cpp.i

src/core/CMakeFiles/core.dir/ThermalApproach.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/ThermalApproach.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/ThermalApproach.cpp -o CMakeFiles/core.dir/ThermalApproach.cpp.s

src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o.requires

src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o.provides: src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o.provides

src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o.provides.build: src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o


src/core/CMakeFiles/core.dir/Processor.cpp.o: src/core/CMakeFiles/core.dir/flags.make
src/core/CMakeFiles/core.dir/Processor.cpp.o: ../src/core/Processor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object src/core/CMakeFiles/core.dir/Processor.cpp.o"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/Processor.cpp.o -c /home/es/Desktop/test_MiL/McFTP-master/src/core/Processor.cpp

src/core/CMakeFiles/core.dir/Processor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/Processor.cpp.i"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/es/Desktop/test_MiL/McFTP-master/src/core/Processor.cpp > CMakeFiles/core.dir/Processor.cpp.i

src/core/CMakeFiles/core.dir/Processor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/Processor.cpp.s"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/es/Desktop/test_MiL/McFTP-master/src/core/Processor.cpp -o CMakeFiles/core.dir/Processor.cpp.s

src/core/CMakeFiles/core.dir/Processor.cpp.o.requires:

.PHONY : src/core/CMakeFiles/core.dir/Processor.cpp.o.requires

src/core/CMakeFiles/core.dir/Processor.cpp.o.provides: src/core/CMakeFiles/core.dir/Processor.cpp.o.requires
	$(MAKE) -f src/core/CMakeFiles/core.dir/build.make src/core/CMakeFiles/core.dir/Processor.cpp.o.provides.build
.PHONY : src/core/CMakeFiles/core.dir/Processor.cpp.o.provides

src/core/CMakeFiles/core.dir/Processor.cpp.o.provides.build: src/core/CMakeFiles/core.dir/Processor.cpp.o


# Object files for target core
core_OBJECTS = \
"CMakeFiles/core.dir/TempWatcher.cpp.o" \
"CMakeFiles/core.dir/ExecutionInterrupter.cpp.o" \
"CMakeFiles/core.dir/Worker.cpp.o" \
"CMakeFiles/core.dir/ComponentsDefine.cpp.o" \
"CMakeFiles/core.dir/TaskLoad.cpp.o" \
"CMakeFiles/core.dir/structdef.cpp.o" \
"CMakeFiles/core.dir/PowerManager.cpp.o" \
"CMakeFiles/core.dir/Dispatcher.cpp.o" \
"CMakeFiles/core.dir/Task.cpp.o" \
"CMakeFiles/core.dir/TaskArgument.cpp.o" \
"CMakeFiles/core.dir/ThermalApproach.cpp.o" \
"CMakeFiles/core.dir/Processor.cpp.o"

# External object files for target core
core_EXTERNAL_OBJECTS =

src/core/libcore.a: src/core/CMakeFiles/core.dir/TempWatcher.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/Worker.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/TaskLoad.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/structdef.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/PowerManager.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/Dispatcher.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/Task.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/TaskArgument.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/Processor.cpp.o
src/core/libcore.a: src/core/CMakeFiles/core.dir/build.make
src/core/libcore.a: src/core/CMakeFiles/core.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/es/Desktop/test_MiL/McFTP-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Linking CXX static library libcore.a"
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && $(CMAKE_COMMAND) -P CMakeFiles/core.dir/cmake_clean_target.cmake
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/core.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/core/CMakeFiles/core.dir/build: src/core/libcore.a

.PHONY : src/core/CMakeFiles/core.dir/build

src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/TempWatcher.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/ExecutionInterrupter.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/Worker.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/ComponentsDefine.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/TaskLoad.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/structdef.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/PowerManager.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/Dispatcher.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/Task.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/TaskArgument.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/ThermalApproach.cpp.o.requires
src/core/CMakeFiles/core.dir/requires: src/core/CMakeFiles/core.dir/Processor.cpp.o.requires

.PHONY : src/core/CMakeFiles/core.dir/requires

src/core/CMakeFiles/core.dir/clean:
	cd /home/es/Desktop/test_MiL/McFTP-master/build/src/core && $(CMAKE_COMMAND) -P CMakeFiles/core.dir/cmake_clean.cmake
.PHONY : src/core/CMakeFiles/core.dir/clean

src/core/CMakeFiles/core.dir/depend:
	cd /home/es/Desktop/test_MiL/McFTP-master/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/es/Desktop/test_MiL/McFTP-master /home/es/Desktop/test_MiL/McFTP-master/src/core /home/es/Desktop/test_MiL/McFTP-master/build /home/es/Desktop/test_MiL/McFTP-master/build/src/core /home/es/Desktop/test_MiL/McFTP-master/build/src/core/CMakeFiles/core.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/core/CMakeFiles/core.dir/depend

