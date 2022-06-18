message(STATUS "YES APPLE")
add_compile_definitions(MACE_APPLE)
set(DEVELOPMENT_TEAM_ID "839W3SDA39")                       # <== Set to your team ID from Apple
set(FRAMEWORK_BUNDLE_IDENTIFIER "dev.bdon.mace")    # <== Set to your framework's bundle identifier (cannot be the same as app bundle identifier)
set(TEST_NAME "Tests")                                      # <== Set to your test's name
set(TEST_BUNDLE_IDENTIFIER "dev.bdon.mace.tests")             # <== Set to your tests's bundle ID
set(CODE_SIGN_IDENTITY "iPhone Developer")                  # <== Set to your preferred code sign identity, to see list:
# /usr/bin/env xcrun security find-identity -v -p codesigning
set(DEPLOYMENT_TARGET 13.0)                                  # <== Set your deployment target version of iOS
set(DEVICE_FAMILY "1")                                      # <== Set to "1" to target iPhone, set to "2" to target iPad, set to "1,2" to target both
set(LOGIC_ONLY_TESTS 0)                                     # <== Set to 1 if you do not want tests to be hosted by the application, speeds up pure logic tests but you can not run them on real devices
set(MACOSX_BUNDLE_INFO_STRING ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_GUI_IDENTIFIER ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_BUNDLE_NAME ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_ICON_FILE "")
set(MACOSX_BUNDLE_LONG_VERSION_STRING "1.0")
set(MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0")
set(MACOSX_BUNDLE_BUNDLE_VERSION "1.0")
set(MACOSX_BUNDLE_COPYRIGHT "Copyright Brandon Martin")
set(MACOSX_DEPLOYMENT_TARGET ${DEPLOYMENT_TARGET})
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fobjc-arc")
if (IOS OR "${CMAKE_SYSTEM_NAME}" STREQUAL "iOS")
    message(STATUS "YES IOS")
    add_compile_definitions(MACE_IOS)
endif()