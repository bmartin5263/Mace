cmake_minimum_required(VERSION 3.21)

if ("${CMAKE_SYSTEM_NAME}" STREQUAL "Android")
    set(Android 1)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")
set(CMAKE_SHARED_LINKER_FLAGS "-Wall")
set(FRAMEWORK_NAME "Mace")                                # <== Set to your framework's name

add_definitions(-DGLES_SILENCE_DEPRECATION)

if (APPLE)
    include(AppleConfig)
endif()

project(Mace)

if (Android)
    include(AndroidConfig)
endif()

add_subdirectory(core/src)