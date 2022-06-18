target_sources(${FRAMEWORK_NAME} PUBLIC
        ${CMAKE_CURRENT_LIST_DIR}/IosBridge.mm
        ${CMAKE_CURRENT_LIST_DIR}/IosBridge.h
        ${CMAKE_CURRENT_LIST_DIR}/IosAppDelegate.mm
        ${CMAKE_CURRENT_LIST_DIR}/IosAppDelegate.h
        ${CMAKE_CURRENT_LIST_DIR}/IosSceneDelegate.mm
        ${CMAKE_CURRENT_LIST_DIR}/IosSceneDelegate.h
        ${CMAKE_CURRENT_LIST_DIR}/IosGLKViewController.mm
        ${CMAKE_CURRENT_LIST_DIR}/IosGLKViewController.h
        ${CMAKE_CURRENT_LIST_DIR}/IosGLKView.mm
        ${CMAKE_CURRENT_LIST_DIR}/IosGLKView.h
)

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