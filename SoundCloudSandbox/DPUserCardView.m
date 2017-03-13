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

@import ReactiveObjC;


//--------------------------------------------------------------------------------------------------
#pragma mark - DPUserCardView Internal Interface

@interface DPUserCardView ()
@property (nonatomic, strong) IBOutlet UILabel *fullNameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *avatarImageView;
@end

//..................................................................................................
#pragma mark - DPUserCardView Implementation

@implementation DPUserCardView
@dynamic viewModel;

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

//..................................................................................................
#pragma mark - Overrides

- (void)observeViewModel {
    // #dev_architecture Ensure inputs are changing in a batch
    [RACObserve(self.viewModel, outputs) subscribeNext:^(id<DPUserCardViewModelOutputs> outputs) {
        self.fullNameLabel.text = outputs.fullNameLabelText;
//        self.avatarImageView.image = outputs.nameLabelText;
    }];
}


@end
