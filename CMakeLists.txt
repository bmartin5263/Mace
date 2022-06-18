cmake_minimum_required (VERSION 3.7)

set(CMAKE_CXX_STANDARD 11)

if (APPLE)
    message(STATUS "YES APPLE")
endif()

if (IOS)
    message(STATUS "YES IOS")
    add_compile_definitions(MACE_IOS)
endif()

if (ANDROID)
    message(STATUS "YES ANDROID")
    add_compile_definitions(MACE_ANDROID)
endif()

#set(DEVELOPMENT_PROJECT_NAME "zircon.xcodeproj")                     # <== Set to your project name, e.g. project.xcodeproj
set(DEVELOPMENT_TEAM_ID "839W3SDA39")                       # <== Set to your team ID from Apple
#set(APP_NAME "Mace")                                     # <== Set To your app's name
#set(APP_BUNDLE_IDENTIFIER "dev.bdon.zircon")                # <== Set to your app's bundle identifier
set(FRAMEWORK_NAME "MaceFramework")                                # <== Set to your framework's name
set(FRAMEWORK_BUNDLE_IDENTIFIER "dev.bdon.zirconframework")    # <== Set to your framework's bundle identifier (cannot be the same as app bundle identifier)
set(TEST_NAME "Tests")                                      # <== Set to your test's name
set(TEST_BUNDLE_IDENTIFIER "dev.bdon.tests")             # <== Set to your tests's bundle ID
set(CODE_SIGN_IDENTITY "iPhone Developer")                  # <== Set to your preferred code sign identity, to see list:
                                                            # /usr/bin/env xcrun security find-identity -v -p codesigning
set(DEPLOYMENT_TARGET 13.0)                                  # <== Set your deployment target version of iOS
set(DEVICE_FAMILY "1")                                      # <== Set to "1" to target iPhone, set to "2" to target iPad, set to "1,2" to target both
set(LOGIC_ONLY_TESTS 0)                                     # <== Set to 1 if you do not want tests to be hosted by the application, speeds up pure logic tests but you can not run them on real devices

project(Mace)
include(BundleUtilities)
include(FindXCTest)

message(STATUS XCTestFound:${XCTest_FOUND})

set(MACOSX_BUNDLE_INFO_STRING ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_GUI_IDENTIFIER ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_BUNDLE_NAME ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_ICON_FILE "")
set(MACOSX_BUNDLE_LONG_VERSION_STRING "1.0")
set(MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0")
set(MACOSX_BUNDLE_BUNDLE_VERSION "1.0")
set(MACOSX_BUNDLE_COPYRIGHT "Copyright YOU")
set(MACOSX_DEPLOYMENT_TARGET ${DEPLOYMENT_TARGET})

# Build the C++ dynamically linked framework
add_subdirectory(src)

# Turn on ARC
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fobjc-arc")
