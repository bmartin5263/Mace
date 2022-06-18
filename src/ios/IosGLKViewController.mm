//
// Created by Brandon on 6/12/22.
//

#import "IosGLKViewController.h"
#include "IosBridge.h"

@interface IosGLKViewController () {}

@end

@implementation IosGLKViewController

- (void)viewDidLoad
{
    NSLog(@"IosGLKViewController::viewDidLoad()");

    [EAGLContext setCurrentContext:IosBridge::Instance()->getEaglContext()];

    IosBridge::Instance()->initRenderer();
}

- (void)loadView
{
    NSLog(@"IosGLKViewController::loadView()");
    self.view = IosBridge::Instance()->createGlkView();
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"IosGLKViewController::viewDidAppear()");
}

- (void)update {
    NSLog(@"IosGLKViewController::update()");
    IosBridge::Instance()->onUpdate();
}


@end
