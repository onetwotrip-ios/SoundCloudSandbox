//
//  DPAppDelegate.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPAppDelegate.h"

#import "DPRootViewController.h"
#import "DPAppRouter.h"

static const NSUInteger kTestUserID = 3207;

@implementation DPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    DPRootViewController *rootVC = [DPRootViewController new];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];

    DPAppRouter *router = [[DPAppRouter alloc] init];
    router.rootVC = rootVC;
    rootVC.router = router; // to keep router alive
    [router showFavoriteTracksForUserWithID:kTestUserID];

    return YES;
}

@end
