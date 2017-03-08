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
@end

@implementation DPViewController
@dynamic view;
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSAssert([self.view isKindOfClass: DPView.class], @"DPViewController should be used with DPView only");
}

- (id<DPViewModelType>)viewModel {
    return self.view.viewModel;
}

- (void)loadView {
    self.view = [[DPView alloc] init];
}



@end
