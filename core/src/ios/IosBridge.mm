//
// Created by Brandon on 6/11/22.
//

#include "IosBridge.h"
#include "IosGLKViewController.h"
#include "IosGLKView.h"
#include "../Engine.h"
#import "IosAppDelegate.h"

IosBridge* IosBridge::instance = nullptr;

IosBridge::IosBridge(Engine* engine)
        : engine(engine)
{
    NSLog(@"IosBridge::IosBridge()");
    IosBridge::instance = this;
}

id IosBridge::iosReady(id scene) {
    NSLog(@"=> IosBridge::iosReady()");

    auto* windowScene = (UIWindowScene*)scene;
    this->appDelegate = [UIApplication sharedApplication].delegate;

    UIWindow* win = [[UIWindow alloc] initWithWindowScene:windowScene];

    this->eaglContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    if (this->eaglContext == nil) {
        this->eaglContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    }

    IosGLKViewController* _glkViewController = [[IosGLKViewController alloc] init];
    _glkViewController.preferredFramesPerSecond = 60;
    this->glkViewController = _glkViewController;

    win.rootViewController = this->glkViewController;
    win.backgroundColor = [UIColor blueColor];

    this->window = win;
    [this->window makeKeyAndVisible];

    NSLog(@"<= IosBridge::iosReady()");

    return win;
}

void IosBridge::onDidFinishLaunching() {
    NSLog(@"IosBridge::onDidFinishLaunching()");
}

void IosBridge::onWillResignActive() {
    NSLog(@"IosBridge::onWillResignActive()");
}

void IosBridge::onDidEnterBackground() {
    NSLog(@"IosBridge::onDidEnterBackground()");
}

void IosBridge::onWillEnterForeground() {
    NSLog(@"IosBridge::onWillEnterForeground()");
}

void IosBridge::onDidBecomeActive() {
    NSLog(@"IosBridge::onDidBecomeActive()");
}

void IosBridge::onWillTerminate() {
    NSLog(@"IosBridge::onWillTerminate()");
}

void IosBridge::onDraw() {
    NSLog(@"IosBridge::onDraw()");
    engine->draw();
}

void IosBridge::terminate() {
    NSLog(@"=> IosBridge::terminate()");

    [this->window invalidate];
    this->window = nil;

    [this->appDelegate invalidate];
    this->appDelegate = nil;

    this->eaglContext = nil;
    this->glkView = nil;

    NSLog(@"<= IosBridge::terminate()");
}

IosBridge::~IosBridge() {
    NSLog(@"IosBridge::~IosBridge()");
    IosBridge::instance = nullptr;
}

id IosBridge::createGlkView() {
    CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    IosGLKView* _glkView = [[IosGLKView alloc] initWithFrame:mainScreenBounds];
    _glkView.drawableColorFormat   = GLKViewDrawableColorFormatRGBA8888;
    _glkView.drawableDepthFormat   = GLKViewDrawableDepthFormat24;
    _glkView.drawableStencilFormat = GLKViewDrawableStencilFormatNone;
    _glkView.drawableMultisample   = GLKViewDrawableMultisampleNone;
    _glkView.context = this->eaglContext;
    _glkView.delegate = this->appDelegate;
    _glkView.enableSetNeedsDisplay = NO;
    _glkView.userInteractionEnabled = YES;
    _glkView.multipleTouchEnabled = YES;
    _glkView.contentScaleFactor = 1.0f;
    _glkView.backgroundColor = [UIColor greenColor];
    this->glkView = _glkView;
    [this->window addSubview:_glkView];
    return glkView;
}

void IosBridge::initRenderer() {
    engine->initRenderer();
}

void IosBridge::main() {
    @autoreleasepool {
        int argc = 0;
        char* argv[] = {};
        UIApplicationMain(argc, argv, nil, NSStringFromClass([IosAppDelegate class]));
    }
}

void IosBridge::onUpdate() {
    engine->update();
}
