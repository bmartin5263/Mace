//
// Created by Brandon on 6/12/22.
//

#include "Renderer.h"

void Renderer::initialize() {
    glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
}

void Renderer::draw() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
}
