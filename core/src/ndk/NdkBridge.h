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

    void setFocused(bool value) { this->focused = value; }
    [[nodiscard]] bool hasFocus() const { return focused; }

private:
    android_app* androidApp;
    Engine* engine;

    bool hasWindow{false};
    bool focused{false};
};


#endif //MACE_NDKBRIDGE_H
