//
//  DPTrackCardViewModel.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewModel.h"
#import "DPTrackCardViewModelType.h"

NS_ASSUME_NONNULL_BEGIN

@class DPTrack;

@interface DPTrackCardViewModel : DPViewModel <DPTrackCardViewModelType>
@property (nonatomic, strong) DPTrack *track;
@end

NS_ASSUME_NONNULL_END
