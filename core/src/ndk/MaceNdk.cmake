include(AndroidNdkModules)
android_ndk_import_module_native_app_glue()

target_sources(${FRAMEWORK_NAME} PUBLIC
        ${CMAKE_CURRENT_LIST_DIR}/gl3stub.h
        ${CMAKE_CURRENT_LIST_DIR}/NdkBridge.cpp
        ${CMAKE_CURRENT_LIST_DIR}/NdkBridge.h
        ${CMAKE_CURRENT_LIST_DIR}/AndroidLog.cpp
)

target_link_libraries(${FRAMEWORK_NAME} PUBLIC
        native_app_glue
        GLESv3
        EGL
        log
        android
        atomic
)

target_include_directories(${FRAMEWORK_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

set_target_properties(
        ${FRAMEWORK_NAME}
        PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED YES
        CXX_EXTENSIONS NO
        INTERFACE_INCLUDE_DIRECTORIES $<TARGET_PROPERTY:Mace,INCLUDE_DIRECTORIES>
)