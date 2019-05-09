# Install script for directory: /home/es/Desktop/test_MiL/McFTP-master/src

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
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/interfaces/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/benchmarks/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/UnitTest/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/configuration/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/core/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/dispatchers/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/pthread/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/results/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/tasks/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/taskloads/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/performance_counter/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/soft_temperature_sensor/cmake_install.cmake")
  include("/home/es/Desktop/test_MiL/McFTP-master/build/src/utils/cmake_install.cmake")

endif()

