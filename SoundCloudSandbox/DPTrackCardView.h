//
//  DPTrackCardView.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPView.h"

#import "DPNibLoadable.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DPTrackCardViewModelType;

@interface DPTrackCardView : DPView <DPNibLoadable>
@property (nonatomic, strong) id<DPTrackCardViewModelType> viewModel;
@end

NS_ASSUME_NONNULL_END
