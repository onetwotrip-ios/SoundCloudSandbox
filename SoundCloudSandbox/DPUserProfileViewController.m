//
//  DPUserProfileViewController.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPUserProfileViewController.h"

#import "DPUserProfileViewModelType.h"

#import "UIViewController+DPStoryboardLoadable.h"

@import ReactiveObjC;


//--------------------------------------------------------------------------------------------------
#pragma mark - DPUserProfileViewController Internal Interface

@interface DPUserProfileViewController ()
@property (nonatomic, strong) IBOutlet UIButton *refreshButton;
@end

//..................................................................................................
#pragma mark - DPUserProfileViewController Implementation

@implementation DPUserProfileViewController
@dynamic viewModel;

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.view bringSubviewToFront:self.refreshButton];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)refreshButtonTouched:(UIButton *)sender {
    [self.viewModel.inputs reload];
}

@end
