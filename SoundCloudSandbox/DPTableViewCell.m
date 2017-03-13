//
//  DPTableViewCell.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTableViewCell.h"

#import "DPView.h"

@import PureLayout;

@implementation DPTableViewCell

- (void)setManagedView:(DPView *)managedView {
    NSAssert(!_managedView, @"Managed view can't be set twice");
    _managedView = managedView;
    [self.contentView addSubview: _managedView];
    [_managedView autoPinEdgesToSuperviewEdges];
}

@end
