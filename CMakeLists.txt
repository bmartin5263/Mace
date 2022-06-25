cmake_minimum_required(VERSION 3.19)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules/android/")
set(CMAKE_SHARED_LINKER_FLAGS "-Wall")
set(FRAMEWORK_NAME "Mace")                                # <== Set to your framework's name

add_definitions(-DGLES_SILENCE_DEPRECATION)

if (APPLE)
    include(cmake/AppleConfig.cmake)
endif()

project(Mace)

if (Android)
    include(cmake/AndroidConfig.cmake)
endif()

add_subdirectory(core/src)
