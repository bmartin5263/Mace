//
// Created by Brandon on 6/12/22.
//

#include "Engine.h"

void Engine::Launch() {
    auto engine = new Engine;
    engine->run();
    delete engine;
}

Engine::Engine() {
#ifdef MACE_IOS
    iosBridge.reset(new IosBridge(this));
#elifdef MACE_ANDROID
    ndkBridge.reset(new NdkBridge);
#endif
}

void Engine::run() {
#ifdef MACE_IOS
    iosBridge->main();
#elifdef MACE_ANDROID
    ndkBridge->main();
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
