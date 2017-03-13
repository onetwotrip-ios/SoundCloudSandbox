//
//  DPUserProfileViewModel.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPUserProfileViewModel.h"
#import "DPTrackServiceType.h"
#import "DPUserServiceType.h"

#import "DPUser.h"

@import ReactiveObjC;

NS_ASSUME_NONNULL_BEGIN

@interface DPUserProfileViewModel () <DPUserProfileViewModelInputs,
                                      DPUserProfileViewModelOutputs,
                                      DPUserProfileViewModelInOutputs>
@property (nonatomic, strong) DPUser *user;
@property (nonatomic, copy) NSSet<DPTrack *> *tracks;
@end

NS_ASSUME_NONNULL_END


//..................................................................................................
#pragma mark - DPUserProfileViewModel Implementation

@implementation DPUserProfileViewModel

- (void)reload {
    const NSUInteger kLowerBound = 10000;
    const NSUInteger kUpperBound = 20000;
    NSUInteger userID = arc4random_uniform(kUpperBound - kLowerBound) + kLowerBound;
    
    @weakify(self);
    [[RACSignal
        zip:@[[self.trackService favoriteTracksForUserWithID:userID],
              [self.userService userWithID:userID]]]
        subscribeNext:^(RACTuple *tuple) {
            @strongify(self);
            DPTrackSet tracks = tuple.first;
            DPUser *user = tuple.second;
            self.tracks = [tracks copy];
            self.user = user;
        }];
}

@end
