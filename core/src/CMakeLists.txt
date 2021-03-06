cmake_minimum_required(VERSION 3.21)

if ("${CMAKE_SYSTEM_NAME}" STREQUAL "Android")
    set(Android 1)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/../../cmake/")
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

add_library(${FRAMEWORK_NAME} SHARED
        Engine.cpp
        Engine.h
        Renderer.cpp
        Renderer.h
        Main.h
        Log.h
)

if (Android)
    message(STATUS "Including Android Sources")
    include(ndk/MaceNdk.cmake)
elseif(APPLE)
    if (IOS)
        message(STATUS "Including iOS Sources")
        include(ios/MaceIos.cmake)
    endif()
endif()

## Symbol visibility setup, COMPILE_FLAGS only affect C++ so for Objective C we
## have to use XCODE_ATTRIBUTE_OTHER_CFLAGS.

#set_target_properties(${FRAMEWORK_NAME} PROPERTIES
#    COMPILE_FLAGS "-fvisibility=hidden -fvisibility-inlines-hidden"
#    XCODE_ATTRIBUTE_OTHER_CFLAGS "-fvisibility=hidden -fvisibility-inlines-hidden")

