//
//  DPAppDelegate.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPAppDelegate.h"

#import "DPRootViewController.h"
#import "DPTrackListViewController.h"
#import "DPTrackListViewModel.h"

#import "DPTrackService.h"
#import "DPTrack+DPDummy.h"
#import "DPTrackCardView.h"

@import PureLayout;

@implementation DPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    DPRootViewController *rootVC = [DPRootViewController new];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    DPTrackListViewController *trackListVC = [DPTrackListViewController dp_loadFromStoryboard];
    DPTrackListViewModel *trackListVM = [DPTrackListViewModel new];
    trackListVC.viewModel = trackListVM;
    
    [rootVC addChildViewController: trackListVC];
    [trackListVC didMoveToParentViewController: rootVC];
    [rootVC.view addSubview: trackListVC.view];
    [trackListVC.view autoPinEdgesToSuperviewEdges];
    
    NSMutableSet *tracks = [NSMutableSet new];
    for (int i = 0; i < 100; ++i) {
        [tracks addObject: [DPTrack dp_dummy]];
    }
    
    trackListVM.tracks = tracks;
    
    
    return YES;
}

@end
