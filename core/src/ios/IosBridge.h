//
// Created by Brandon on 6/11/22.
//

#ifndef MACE_IOSBRIDGE_H
#define MACE_IOSBRIDGE_H


#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#else
using id = void*;
#endif
#include "../Renderer.h"

class Engine;
class IosBridge {
public:

    static IosBridge* instance;
    static IosBridge* Instance() {
        return instance;
    }

    explicit IosBridge(Engine* engine);
    ~IosBridge();

    void main();

    id iosReady(id scene);
    id createGlkView();

    void terminate();

    void onDidFinishLaunching();
    void onWillResignActive();
    void onDidEnterBackground();
    void onWillEnterForeground();
    void onDidBecomeActive();
    void onWillTerminate();
    void onDraw();
    void onUpdate();

    void setEaglContext(id context) {
        this->eaglContext = context;
    }

    id getEaglContext() {
        return this->eaglContext;
    }

    void initRenderer();

private:
    Engine* engine;
    id appDelegate{};
    id window{};
    id eaglContext{};
    id glkView{};
    id glkViewController{};
};


#endif //MACE_IOSBRIDGE_H
