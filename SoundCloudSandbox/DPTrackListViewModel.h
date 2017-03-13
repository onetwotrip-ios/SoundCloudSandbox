//
//  DPTrackListViewModel.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewModel.h"
#import "DPTrackListViewModelType.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DPTrackServiceType;
@class DPTrack; // #dev_architecture make another protocol?

@interface DPTrackListViewModel : DPViewModel <DPTrackListViewModelType>
@property (nonatomic, copy) NSSet<DPTrack *> *tracks;
@end

NS_ASSUME_NONNULL_END
