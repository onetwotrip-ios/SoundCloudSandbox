//
//  DPUserProfileViewModel.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewModel.h"
#import "DPUserProfileViewModelType.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DPTrackServiceType;
@protocol DPUserServiceType;

@class DPTrack;
@class DPUser;

@interface DPUserProfileViewModel : DPViewModel <DPUserProfileViewModelType>

@property (nonatomic, strong) id<DPTrackServiceType> trackService;
@property (nonatomic, strong) id<DPUserServiceType> userService;

@property (nullable, nonatomic, readonly) DPUser *user;
@property (nullable, nonatomic, readonly) NSSet<DPTrack *> *tracks;

@end

NS_ASSUME_NONNULL_END
