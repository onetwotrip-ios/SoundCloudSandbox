//
//  DPAppDelegate.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPAppDelegate.h"

#import "DPRootViewController.h"

@implementation DPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    DPRootViewController *vc = [DPRootViewController new];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
