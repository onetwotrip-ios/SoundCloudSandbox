//
//  DPAppRouter.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPAppRouter.h"

#import "DPRootViewController.h"

#import "DPUserProfileViewController.h"
#import "DPUserProfileViewModel.h"

#import "DPTrackListViewController.h"
#import "DPTrackListViewModel.h"

#import "DPUserCardViewModel.h"
#import "DPUserCardView.h"

#import "DPServiceContainer.h"
#import "DPTrackServiceType.h"
#import "DPUserServiceType.h"

@import ReactiveObjC;
@import PureLayout;

NS_ASSUME_NONNULL_BEGIN

@interface DPAppRouter ()
@property (nonatomic, readonly) DPServiceContainer *serviceContainer;
@end

NS_ASSUME_NONNULL_END

//--------------------------------------------------------------------------------------------------
#pragma mark - DPAppRouter Implementation

@implementation DPAppRouter

- (instancetype)init {
    if (self = [super init]) {
        _serviceContainer = [DPServiceContainer productionContainer];
    }
    return self;
}

- (void)showFavoriteTracksForUserWithID:(NSUInteger)userID {
    // No time to fix this mess. Maybe later.
    // 1. Assemble UserProfile Module
    DPUserProfileViewController *userProfileVC = [DPUserProfileViewController dp_loadFromStoryboard];
    DPUserProfileViewModel *userProfileVM = [DPUserProfileViewModel new];
    userProfileVM.trackService = self.serviceContainer.trackService;
    userProfileVM.userService = self.serviceContainer.userService;
    userProfileVC.viewModel = userProfileVM;

    [self.rootVC addChildViewController:userProfileVC];
    [userProfileVC didMoveToParentViewController:self.rootVC];
    [self.rootVC.view addSubview:userProfileVC.view];
    [userProfileVC.view autoPinEdgesToSuperviewEdges];

    // 2. Assemble TrackList Module
    DPTrackListViewController *trackListVC = [DPTrackListViewController dp_loadFromStoryboard];
    DPTrackListViewModel *trackListVM = [DPTrackListViewModel new];
    trackListVC.viewModel = trackListVM;

    // 3. Bind UserProfile and Tracklist Modules
    RAC(trackListVM, tracks) = RACObserve(userProfileVM, tracks);
    [userProfileVC addChildViewController:trackListVC];
    [trackListVC didMoveToParentViewController:userProfileVC];
    [userProfileVC.view addSubview:trackListVC.view];
    [trackListVC.view autoPinEdgesToSuperviewEdges];

    // 4. Assemble UserCard Module
    DPUserCardView *userCardView = [DPUserCardView dp_loadFromNib];
    DPUserCardViewModel *userCardVM = [DPUserCardViewModel new];
    userCardView.viewModel = userCardVM;

    // 5. Bind UserCard and UserProfile Modules
    RAC(userCardVM, user) = RACObserve(userProfileVM, user);
    trackListVC.headerView = userCardView;

    // 6. Initial reload
    [userProfileVM.inputs reload];
}

@end
