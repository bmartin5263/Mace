cmake_minimum_required (VERSION 3.7)

set(LIBRARY_SOURCE
        ${CMAKE_CURRENT_LIST_DIR}/Foo.hh
        ${CMAKE_CURRENT_LIST_DIR}/Foo.cpp
        ios/IosBridge.mm
        ios/IosBridge.h
        ios/IosAppDelegate.mm
        ios/IosAppDelegate.h
        ios/IosSceneDelegate.mm
        ios/IosSceneDelegate.h
        Renderer.cpp Renderer.h ios/IosGLKViewController.mm ios/IosGLKViewController.h ios/IosGLKView.mm ios/IosGLKView.h
        Engine.cpp Engine.h
        )

add_library(${FRAMEWORK_NAME} SHARED
        Engine.cpp
        Engine.h
        Renderer.cpp
        Renderer.h
        )

target_sources(${FRAMEWORK_NAME} PUBLIC
        ios/IosBridge.mm
        ios/IosBridge.h
        ios/IosAppDelegate.mm
        ios/IosAppDelegate.h
        ios/IosSceneDelegate.mm
        ios/IosSceneDelegate.h
        ios/IosGLKViewController.mm
        ios/IosGLKViewController.h
        ios/IosGLKView.mm
        ios/IosGLKView.h
        )

set(CMAKE_SHARED_LINKER_FLAGS "-Wall")

find_library(UIKIT UIKit)
find_library(OpenGl OpenGLES)
find_library(GLKIT GLKit)
find_library(FOUNDATION Foundation)
find_library(MOBILECORESERVICES MobileCoreServices)
find_library(CFNETWORK CFNetwork)
find_library(SYSTEMCONFIGURATION SystemConfiguration)

# link the frameworks located above
target_link_libraries(${FRAMEWORK_NAME} ${UIKIT})
target_link_libraries(${FRAMEWORK_NAME} ${GLKIT})
target_link_libraries(${FRAMEWORK_NAME} ${OpenGl})
target_link_libraries(${FRAMEWORK_NAME} ${FOUNDATION})
target_link_libraries(${FRAMEWORK_NAME} ${MOBILECORESERVICES})
target_link_libraries(${FRAMEWORK_NAME} ${CFNETWORK})
target_link_libraries(${FRAMEWORK_NAME} ${SYSTEMCONFIGURATION})

include(ios/CMakeLists.txt)

## Symbol visibility setup, COMPILE_FLAGS only affect C++ so for Objective C we
## have to use XCODE_ATTRIBUTE_OTHER_CFLAGS.

#set_target_properties(${FRAMEWORK_NAME} PROPERTIES
#    COMPILE_FLAGS "-fvisibility=hidden -fvisibility-inlines-hidden"
#    XCODE_ATTRIBUTE_OTHER_CFLAGS "-fvisibility=hidden -fvisibility-inlines-hidden")

