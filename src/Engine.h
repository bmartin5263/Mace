//
// Created by Brandon on 6/12/22.
//

#ifndef MACE_ENGINE_H
#define MACE_ENGINE_H

#include <memory>
#include "Renderer.h"

#ifdef MACE_IOS
#include "ios/IosBridge.h"
#elifdef MACE_ANDROID
#include "ndk/NdkBridge.h"
#endif

class Engine {
public:
    static void Launch();

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
#elifdef MACE_ANDROID
    std::unique_ptr<NdkBridge> ndkBridge{nullptr};
#endif

};


#endif //MACE_ENGINE_H
