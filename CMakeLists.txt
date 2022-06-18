cmake_minimum_required(VERSION 3.7)
cmake_policy(SET CMP0080 OLD)
cmake_policy(SET CMP0076 NEW)

set(CMAKE_CXX_STANDARD 11)

if (APPLE)
    message(STATUS "YES APPLE")
    add_compile_definitions(MACE_APPLE)
endif()

if (IOS)
    message(STATUS "YES IOS")
    add_compile_definitions(MACE_IOS)
endif()

if (ANDROID)
    message(STATUS "YES ANDROID")
    add_compile_definitions(MACE_ANDROID)
endif()

project(Mace)

# Build the C++ dynamically linked framework
add_subdirectory(src)

# Turn on ARC
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fobjc-arc")
