//
//  DPUserCardView.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPUserCardView.h"
#import "DPUserCardViewModelType.h"

#import "UIView+DPNibLoadable.h"

#import <SDWebImage/UIImageView+WebCache.h>
@import ReactiveObjC;


//--------------------------------------------------------------------------------------------------
#pragma mark - DPUserCardView Internal Interface

@interface DPUserCardView ()
@property (nonatomic, strong) IBOutlet UILabel *fullNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *nickNameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *avatarImageView;
@end

//..................................................................................................
#pragma mark - DPUserCardView Implementation

@implementation DPUserCardView
@dynamic viewModel;

//..................................................................................................
#pragma mark - Overrides

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CALayer *avatarLayer = self.avatarImageView.layer;
    avatarLayer.cornerRadius = avatarLayer.bounds.size.height * 0.3;
    avatarLayer.masksToBounds = YES;
}

- (void)observeViewModel {
    @weakify(self);
    RAC(self.fullNameLabel,text) = RACObserve(self.viewModel.outputs, fullNameLabelText);
    RAC(self.nickNameLabel,text) = RACObserve(self.viewModel.outputs, nickNameLabelText);
    [RACObserve(self.viewModel.outputs, avatarImageURL) subscribeNext:^(id _Nullable url) {
        @strongify(self);
        [self.avatarImageView sd_setImageWithURL:url];
    }];
}


@end
