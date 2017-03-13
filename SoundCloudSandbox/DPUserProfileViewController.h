//
//  DPUserProfileViewController.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewController.h"

#import "DPStoryboardLoadable.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DPUserProfileViewModelType;

@interface DPUserProfileViewController : DPViewController <DPStoryboardLoadable>
@property (nonatomic, strong) id<DPUserProfileViewModelType> viewModel;
@end

NS_ASSUME_NONNULL_END
