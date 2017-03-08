//
//  DPTableViewCell.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTableViewCell.h"

#import "DPView.h"

@implementation DPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setManagedView:(DPView *)managedView {
    NSAssert(!_managedView, @"You can set managed view only once");
    _managedView = managedView;
    [self.contentView addSubview: _managedView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.managedView.frame = self.contentView.bounds;
}

@end
