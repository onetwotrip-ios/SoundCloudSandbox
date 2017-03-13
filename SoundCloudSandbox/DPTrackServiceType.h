//
//  DPTrackService.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@class RACSignal;
@class DPTrack;

typedef NSSet<DPTrack *> *DPTrackSet;

@protocol DPTrackServiceType

- (RACSignal<DPTrackSet> *) tracksWithIDs: (NSIndexSet *) IDs;

@end

NS_ASSUME_NONNULL_END
