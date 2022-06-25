include(AndroidNdkModules)
android_ndk_import_module_native_app_glue()

target_sources(${FRAMEWORK_NAME} PUBLIC
        gl3stub.h
        NdkBridge.cpp
        NdkBridge.h
)


target_link_libraries(${FRAMEWORK_NAME} PUBLIC
        native_app_glue
        GLESv3
        EGL
        log
        android
        atomic
)

set_target_properties(
        ${FRAMEWORK_NAME}
        PROPERTIES
        CXX_STANDARD 14
        CXX_STANDARD_REQUIRED YES
        CXX_EXTENSIONS NO
#        INTERFACE_INCLUDE_DIRECTORIES $<TARGET_PROPERTY:engine,INCLUDE_DIRECTORIES>
)
#target_include_directories(engine PUBLIC ndk/src)
