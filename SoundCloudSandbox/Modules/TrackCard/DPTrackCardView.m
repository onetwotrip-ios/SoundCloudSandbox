//
//  DPTrackCardView.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTrackCardView.h"
#import "DPTrackCardViewModelType.h"

@import ReactiveObjC;


//--------------------------------------------------------------------------------------------------
#pragma mark - DPTrackCardView Internal Interface

NS_ASSUME_NONNULL_BEGIN

@interface DPTrackCardView ()
@property (nonatomic, strong) IBOutlet UILabel *authorLabel;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *durationLabel;
@end

NS_ASSUME_NONNULL_END


//..................................................................................................
#pragma mark - DPTrackCardView Implementation

@implementation DPTrackCardView
@dynamic viewModel;

//..................................................................................................
#pragma mark - Public Methods

//..................................................................................................
#pragma mark - Overrides

//..................................................................................................
#pragma mark - Internal Methods

@end
