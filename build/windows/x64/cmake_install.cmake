# Install script for directory: C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/windows

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "$<TARGET_FILE_DIR:gui_v1>")
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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/flutter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/flutter_libserialport/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/permission_handler_windows/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/gui_v1.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug" TYPE EXECUTABLE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/gui_v1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/gui_v1.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile" TYPE EXECUTABLE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/gui_v1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/gui_v1.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release" TYPE EXECUTABLE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/gui_v1.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/data" TYPE FILE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/windows/flutter/ephemeral/icudtl.dat")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/data" TYPE FILE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/windows/flutter/ephemeral/icudtl.dat")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/data" TYPE FILE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/windows/flutter/ephemeral/icudtl.dat")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug" TYPE FILE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/windows/flutter/ephemeral/flutter_windows.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile" TYPE FILE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/windows/flutter/ephemeral/flutter_windows.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release" TYPE FILE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/windows/flutter/ephemeral/flutter_windows.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/flutter_libserialport_plugin.dll;C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/serialport.dll;C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/permission_handler_windows_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug" TYPE FILE FILES
      "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/flutter_libserialport/Debug/flutter_libserialport_plugin.dll"
      "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/flutter_libserialport/libserialport/Debug/serialport.dll"
      "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/permission_handler_windows/Debug/permission_handler_windows_plugin.dll"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/flutter_libserialport_plugin.dll;C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/serialport.dll;C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/permission_handler_windows_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile" TYPE FILE FILES
      "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/flutter_libserialport/Profile/flutter_libserialport_plugin.dll"
      "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/flutter_libserialport/libserialport/Profile/serialport.dll"
      "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/permission_handler_windows/Profile/permission_handler_windows_plugin.dll"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/flutter_libserialport_plugin.dll;C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/serialport.dll;C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/permission_handler_windows_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release" TYPE FILE FILES
      "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/flutter_libserialport/Release/flutter_libserialport_plugin.dll"
      "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/flutter_libserialport/libserialport/Release/serialport.dll"
      "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/plugins/permission_handler_windows/Release/permission_handler_windows_plugin.dll"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug" TYPE DIRECTORY FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/native_assets/windows/")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile" TYPE DIRECTORY FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/native_assets/windows/")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release" TYPE DIRECTORY FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/native_assets/windows/")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    
  file(REMOVE_RECURSE "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/data/flutter_assets")
  
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    
  file(REMOVE_RECURSE "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/data/flutter_assets")
  
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    
  file(REMOVE_RECURSE "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/data/flutter_assets")
  
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Debug/data" TYPE DIRECTORY FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build//flutter_assets")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/data" TYPE DIRECTORY FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build//flutter_assets")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/data" TYPE DIRECTORY FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build//flutter_assets")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Profile/data" TYPE FILE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/app.so")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/runner/Release/data" TYPE FILE FILES "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/app.so")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/Users/ashim/OneDrive/Documents/repo/flutterapps/gui_lab/Gui_v1/build/windows/x64/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
