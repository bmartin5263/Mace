//
// Created by Brandon on 6/12/22.
//

#ifndef MACE_ENGINE_H
#define MACE_ENGINE_H

#include <memory>
#include "Renderer.h"

#ifdef MACE_IOS
class IosBridge;
#endif
#ifdef MACE_ANDROID
#include "ndk/NdkBridge.h"
#include <android_native_app_glue.h>
#endif

class Engine {
public:
#ifdef MACE_IOS
    static void Launch();
#endif

#ifdef MACE_ANDROID
    static void Launch(struct android_app* app);
    static android_app* androidApp;
#endif

    Engine();

    void run();
    void update();
    void draw();
    void destroy();

    void initRenderer();

private:
    Renderer renderer;
#ifdef MACE_IOS
    std::unique_ptr<IosBridge> iosBridge{nullptr};
#endif
#ifdef MACE_ANDROID
    std::unique_ptr<NdkBridge> ndkBridge{nullptr};
#endif

};


#endif //MACE_ENGINE_H
