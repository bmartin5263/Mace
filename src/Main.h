//
// Created by Brandon on 6/18/22.
//

#ifndef MACE_MAIN_H
#define MACE_MAIN_H

#include "Engine.h"

#ifdef MACE_ANDROID
#include <android_native_app_glue.h>
#endif

#ifdef MACE_ANDROID
#define MaceMain \
android_app* MACE_ANDROID_APP = nullptr; \
void android_main(struct android_app* app) { \
    app_dummy(); \
    MACE_ANDROID_APP = app; \
    Engine::Launch(); \
}
#else
#define MACE_MAIN \
int main(int argc, char * argv[]) { \
    Engine::Launch(); \
}
#endif

#endif //MACE_MAIN_H
