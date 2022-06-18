//
// Created by Brandon on 6/11/22.
//

#include "IosAppDelegate.h"
#include "IosSceneDelegate.h"
#include "IosBridge.h"

@implementation IosAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    IosBridge::Instance()->onDidFinishLaunching();
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    IosBridge::Instance()->onWillResignActive();
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    IosBridge::Instance()->onDidEnterBackground();
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    IosBridge::Instance()->onWillEnterForeground();
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    IosBridge::Instance()->onDidBecomeActive();
}

- (void)applicationWillTerminate:(UIApplication *)application {
    IosBridge::Instance()->onWillTerminate();
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    IosBridge::Instance()->onDraw();
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    NSLog(@"IosAppDelegate::configurationForConnectingSceneSession()");
    UISceneConfiguration *configuration = [[UISceneConfiguration alloc] init];
    configuration.delegateClass = IosSceneDelegate.class;
    configuration.storyboard = nil;
    return configuration;
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    NSLog(@"IosAppDelegate::didDiscardSceneSessions()");
}

@end
