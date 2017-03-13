//
//  DPTrackListViewController.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewController.h"

#import "DPStoryboardLoadable.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DPTrackListViewModelType;

@interface DPTrackListViewController : DPViewController <DPStoryboardLoadable>
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) id<DPTrackListViewModelType> viewModel;
@end

NS_ASSUME_NONNULL_END
