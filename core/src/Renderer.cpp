//
// Created by Brandon on 6/12/22.
//

#include "Renderer.h"

#if defined(MACE_IOS)
#include <OpenGLES/ES3/gl.h>
#elif defined(MACE_ANDROID)
#include <GLES3/gl3.h>
#endif

void Renderer::initialize() {
//#ifdef MACE_IOS
    glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
//#endif
}

void Renderer::draw() {
//#ifdef MACE_IOS
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
//#endif
}
