//
//  DPTrackCardViewModel.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTrackCardViewModel.h"

@import ReactiveObjC;

#import "DPTrack.h"
#import "DPUser.h"

//--------------------------------------------------------------------------------------------------
#pragma mark - DPTrackCardViewModel Implementation

NS_ASSUME_NONNULL_BEGIN

@interface DPTrackCardViewModel () <DPTrackCardViewModelInputs,
                                    DPTrackCardViewModelOutputs,
                                    DPTrackCardViewModelInOutputs>
@property (nonatomic, copy) NSString *authorLabelText;
@property (nonatomic, copy) NSString *nameLabelText;
@property (nonatomic, copy) NSString *durationLabelText;
@end

NS_ASSUME_NONNULL_END

//..................................................................................................
#pragma mark - DPTrackCardViewModel Implementation

@implementation DPTrackCardViewModel

- (void)setTrack:(DPTrack *)track {
    if ([_track isEqual:track]) {
        return;
    }
    _track = track;
    self.authorLabelText   = _track.author.nickName;
    self.nameLabelText     = _track.name;
    self.durationLabelText = [self formattedDuration:_track.duration];
}

- (NSString *)formattedDuration:(NSTimeInterval)duration {
    NSUInteger totalSeconds = round(duration / 1000.0);
    NSUInteger seconds = totalSeconds % 60;

    NSUInteger totalMinutes = totalSeconds / 60;
    NSUInteger minutes = totalMinutes % 60;

    NSUInteger hours = totalMinutes / 60;

    NSMutableArray *mComponents = [NSMutableArray arrayWithObjects:
                                   [NSString stringWithFormat:@"%02lu", minutes],
                                   [NSString stringWithFormat:@"%02lu", seconds], nil];
    if (hours > 0) {
        [mComponents insertObject:[NSString stringWithFormat:@"%lu", hours] atIndex:0];
    }

    return [mComponents componentsJoinedByString:@":"];
}

@end
