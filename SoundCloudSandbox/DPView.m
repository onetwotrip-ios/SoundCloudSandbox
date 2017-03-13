//
//  DPView.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPView.h"

@implementation DPView
@synthesize viewModel = _viewModel;

- (void)setViewModel:(id<DPViewModelType>)viewModel {
    // #dev_architecture Gotta be careful here. Ensure old viewModel will deallocate immediately
    _viewModel = viewModel;

    [self observeViewModel];
}

- (void)observeViewModel {}

@end
