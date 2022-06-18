set(DEVELOPMENT_TEAM_ID "839W3SDA39")                               # <== team ID from Apple
set(FRAMEWORK_BUNDLE_IDENTIFIER "dev.bdon.maceframework")           # <== framework's bundle identifier (cannot be the same as app bundle identifier)
set(TEST_NAME "Tests")                                              # <== test's name
set(TEST_BUNDLE_IDENTIFIER "dev.bdon.tests")                        # <== tests's bundle ID
set(CODE_SIGN_IDENTITY "iPhone Developer")                          # <== preferred code sign identity, to see list:
# /usr/bin/env xcrun security find-identity -v -p codesigning
set(DEPLOYMENT_TARGET 13.0)                                         # <== deployment target version of iOS
set(DEVICE_FAMILY "1")                                              # <== "1" to target iPhone, set to "2" to target iPad, set to "1,2" to target both
set(LOGIC_ONLY_TESTS 0)                                             # <== 1 if you do not want tests to be hosted by the application, speeds up pure logic tests but you can not run them on real devices

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

include(BundleUtilities)
include(FindXCTest)

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

set_target_properties(${FRAMEWORK_NAME} PROPERTIES
    FRAMEWORK TRUE
    FRAMEWORK_VERSION A
    MACOSX_FRAMEWORK_IDENTIFIER ${FRAMEWORK_BUNDLE_IDENTIFIER}
    MACOSX_FRAMEWORK_INFO_PLIST ${CMAKE_CURRENT_LIST_DIR}/framework.plist.in
    # "current version" in semantic format in Mach-O binary file
    VERSION 1.0.0
    # "compatibility version" in semantic format in Mach-O binary file
    SOVERSION 1.0.0
    PUBLIC_HEADER "Engine.h;Renderer.h"
    XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET ${DEPLOYMENT_TARGET}
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ${CODE_SIGN_IDENTITY}
    XCODE_ATTRIBUTE_DEVELOPMENT_TEAM ${DEVELOPMENT_TEAM_ID}
    XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${DEVICE_FAMILY}
    XCODE_ATTRIBUTE_SKIP_INSTALL "YES"
)

add_custom_command(
        TARGET ${FRAMEWORK_NAME}
        POST_BUILD
        COMMAND /bin/bash -c "${CMAKE_CURRENT_LIST_DIR}/install_name.sh \${BUILT_PRODUCTS_DIR}/\${PRODUCT_NAME}.framework/\${PRODUCT_NAME}"
)

add_custom_command(
        TARGET ${FRAMEWORK_NAME}
        POST_BUILD
        COMMAND install_name_tool -id \"@rpath/\${PRODUCT_NAME}.framework/\${PRODUCT_NAME}\"
        \${BUILT_PRODUCTS_DIR}/\${PRODUCT_NAME}.framework/\${PRODUCT_NAME}
)