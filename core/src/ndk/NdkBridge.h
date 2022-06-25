//
// Created by Brandon on 6/18/22.
//

#ifndef MACE_NDKBRIDGE_H
#define MACE_NDKBRIDGE_H

#include <android_native_app_glue.h>

struct android_app;

class Engine;
class NdkBridge {
public:
    explicit NdkBridge(android_app* androidApp, Engine* engine);

    static void OnAppCmd(android_app* androidApp, int32_t cmd);

    void initialize();
//    void onStart();
//    void terminate();

    void onFrame();

private:
    android_app* androidApp;
    Engine* engine;

    bool hasWindow{false};
    bool hasFocus{false};
};


#endif //MACE_NDKBRIDGE_H
