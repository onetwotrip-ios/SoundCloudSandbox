//
//  DPTrackCardViewModelType.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewModelType.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DPTrackCardViewModelInputs <DPViewModelInputs>
@end

@protocol DPTrackCardViewModelInOutputs <DPViewModelInOutputs>
@end

@protocol DPTrackCardViewModelOutputs <DPViewModelOutputs>
@end

@protocol DPTrackCardViewModelType <DPViewModelType>
@property (nonatomic, readonly) id<DPTrackCardViewModelInputs> inputs;
@property (nonatomic, readonly) id<DPTrackCardViewModelOutputs> outputs;
@property (nonatomic, readonly) id<DPTrackCardViewModelInOutputs> inOutputs;
@end

NS_ASSUME_NONNULL_END
