//
//  DPViewController.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewController.h"

#import "DPView.h"

@interface DPViewController ()
@property (nonatomic, strong) DPView *view;
@property (nonatomic, assign) BOOL shouldLoadViewManually;
@end

@implementation DPViewController
@dynamic view;
@dynamic viewModel;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.shouldLoadViewManually = !nibNameOrNil && !nibBundleOrNil;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSAssert([self.view isKindOfClass:DPView.class], @"DPViewController should be used with DPView only");
}

- (void)setViewModel:(id<DPViewModelType>)viewModel {
    self.view.viewModel = viewModel;
    [self observeViewModel];
}

- (id<DPViewModelType>)viewModel {
    return self.view.viewModel;
}

- (void)observeViewModel {}

- (void)loadView {
    if (self.shouldLoadViewManually) {
        self.view = [[DPView alloc] init];
    }
    else {
        [super loadView];
    }
}

@end
