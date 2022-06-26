add_library(${FRAMEWORK_NAME} SHARED
        Engine.cpp
        Engine.h
        Renderer.cpp
        Renderer.h
        Main.h)

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

