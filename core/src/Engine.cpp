//
// Created by Brandon on 6/12/22.
//

#include "Engine.h"

#ifdef MACE_IOS
#include "ios/IosBridge.h"
#endif

#ifdef MACE_IOS
void Engine::Launch() {
    auto engine = new Engine;
    engine->run();
    delete engine;
}
#endif

#ifdef MACE_ANDROID
android_app* Engine::androidApp = nullptr;
void Engine::Launch(struct android_app *app) {
    androidApp = app;
    auto engine = new Engine;
    engine->run();
}
#endif

Engine::Engine() {
#ifdef MACE_IOS
    iosBridge.reset(new IosBridge(this));
#endif
#ifdef MACE_ANDROID
    ndkBridge.reset(new NdkBridge(androidApp, this));
#endif
}

void Engine::run() {
#ifdef MACE_IOS
    iosBridge->main();
#endif
#ifdef MACE_ANDROID
    ndkBridge->initialize();
    while (true) {
        ndkBridge->onFrame();
    }
#endif
}

void Engine::update() {

}

void Engine::draw() {
    renderer.draw();
}

void Engine::destroy() {

}

void Engine::initRenderer() {
    renderer.initialize();
}