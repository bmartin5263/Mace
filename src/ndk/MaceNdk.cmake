include(AndroidNdkModules)
android_ndk_import_module_native_app_glue()


#target_link_libraries(engine PUBLIC
#        native_app_glue
#        GLESv3
#        EGL
#        log
#        android
#        atomic
#        )
#set_target_properties(
#        engine
#        PROPERTIES
#        CXX_STANDARD 14
#        CXX_STANDARD_REQUIRED YES
#        CXX_EXTENSIONS NO
#        INTERFACE_INCLUDE_DIRECTORIES $<TARGET_PROPERTY:engine,INCLUDE_DIRECTORIES>
#)
#target_include_directories(engine PUBLIC ndk/src)
