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
#endif
}

void Engine::run() {
#ifdef MACE_IOS
    iosBridge->main();
#elifndef MACE_ANDROID
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
